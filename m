From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 14 May 2017 23:20:52 +0200
Subject: corrupt clk_core instance in clk_disable_unused_subtree (ARM Meson MX
 platform)
Message-ID: <CAFBinCDjysBNJLQYsvzBU7U2p7gv0Lxa+qe8f5YMn0BgUw6P0g@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hello,

it seems that I am seeing some strange memory corruption on one of my
Amlogic Meson MX (32-bit) devices.
disclaimer: I have some patches in my tree which are not mainlined yet
(see [0]), but cannot see that any of these patches would cause memory
corruption of a clk_core instance.

Oleg (who is CC'ed) has first reported this when testing my kernel tree: [1]
in the meantime I have rebased all of my patches to Linus' mainline
tree, commit 0fcc3ab23d7395f58e8ab0834e7913e2e4314a83 [3]

what I am seeing is a NULL deref in clk_disable_unused_subtree, full
log attached and can be found here: [3]
an explanation of what seems to be going on in my own words is:
- in line #5 of the log the internal PWM mux clock for the first PWM
channel is being registered (everything looks good with
clk_core=0xeddfbf80 and clk_hw=0xeddfbf30)
- the default parent of this mux is "xtal"
- in line #31 of the log the "disable unused clocks" cleanup starts
and checks the first child of the "xtal" clock and seems to find
clk_core=0xeddfbf80 *BUT* clk_hw=0x00000003
- this doesn't seem right and a crash is pretty obvious

I also attached the patch which introduces this additional logspam -
just in case anyone wants to know what these values mean exactly.

now the interesting part:
I can reproduce this with multi_v7_defconfig and
arch/arm/boot/dts/meson8m2-m8s.dts from my tree.
if I leave everything as it is and *only* enable CONFIG_DEBUG_SPINLOCK
then this crash goes away. so this *might* be a race-condition
somewhere...

has anybody seen this crash before? I can help debugging/testing
potential fixes/trying out various things to solve this - just let me
know!


Regards,
Martin


[0] https://github.com/xdarklight/linux/tree/meson-mx-integration-4.12-20170513
[1] http://lists.infradead.org/pipermail/linux-amlogic/2017-May/003497.html
[2] https://github.com/torvalds/linux/commit/0fcc3ab23d7395f58e8ab0834e7913e2e4314a83
[3] https://paste.kde.org/pbefvmqgr
-------------- next part --------------
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index fc58c52a26b4..1942fe2c28b0 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -759,7 +759,7 @@ static void clk_disable_unused_subtree(struct clk_core *core)
 {
 	struct clk_core *child;
 	unsigned long flags;
-
+printk("%s(0x%08x/0x%08x/%s) - empty=%d\n", __func__, core, core->hw, core->name, hlist_empty(&core->children));
 	lockdep_assert_held(&prepare_lock);
 
 	hlist_for_each_entry(child, &core->children, child_node)
@@ -1795,7 +1795,7 @@ static int clk_core_set_parent(struct clk_core *core, struct clk_core *parent)
 
 	if (!core)
 		return 0;
-
+printk("%s(0x%08x/0x%08x/%s, %s)\n", __func__, core, core->hw, core->name, parent ? parent->name : "NULL");
 	/* prevent racing with updates to the clock topology */
 	clk_prepare_lock();
 
@@ -2422,6 +2422,7 @@ static int __clk_core_init(struct clk_core *core)
 		hlist_add_head(&core->child_node,
 				&core->parent->children);
 		core->orphan = core->parent->orphan;
+		printk("%s(0x%08x/0x%08x/%s) -> parent = 0x%08x/0x%08x/%s\n", __func__, core, core->hw, core->name, core->parent, core->parent->hw, core->parent->name);
 	} else if (!core->num_parents) {
 		hlist_add_head(&core->child_node, &clk_root_list);
 		core->orphan = false;
@@ -2621,17 +2622,18 @@ struct clk *clk_register(struct device *dev, struct clk_hw *hw)
 	};
 
 	INIT_HLIST_HEAD(&core->clks);
+	INIT_HLIST_HEAD(&core->children);
 
 	hw->clk = __clk_create_clk(hw, NULL, NULL);
 	if (IS_ERR(hw->clk)) {
 		ret = PTR_ERR(hw->clk);
 		goto fail_parents;
 	}
-
+printk("%s(0x%08x/0x%08x/%s)\n", __func__, core, core->hw, core->name);
 	ret = __clk_core_init(core);
 	if (!ret)
 		return hw->clk;
-
+printk("...failed!\n");
 	__clk_free_clk(hw->clk);
 	hw->clk = NULL;
 
@@ -2671,7 +2673,7 @@ static void __clk_release(struct kref *ref)
 {
 	struct clk_core *core = container_of(ref, struct clk_core, ref);
 	int i = core->num_parents;
-
+printk("%s(0x%08x/%s)\n", __func__, core->hw, core->name);
 	lockdep_assert_held(&prepare_lock);
 
 	kfree(core->parents);
@@ -2728,7 +2730,7 @@ void clk_unregister(struct clk *clk)
 
 	if (!clk || WARN_ON_ONCE(IS_ERR(clk)))
 		return;
-
+printk("%s(%s)\n", __func__, clk->core->name);
 	clk_debug_unregister(clk->core);
 
 	clk_prepare_lock();
diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 4bf0b543ad50..c7238782557e 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -121,12 +121,15 @@ static inline struct meson_pwm *to_meson_pwm(struct pwm_chip *chip)
 static int meson_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
 {
 	struct meson_pwm_channel *channel = pwm_get_chip_data(pwm);
+	struct meson_pwm *meson = to_meson_pwm(chip);
+	struct meson_pwm_channel *chan0 = pwm_get_chip_data(&meson->chip.pwms[0]);
 	struct device *dev = chip->dev;
 	int err;
 
 	if (!channel)
 		return -ENODEV;
-
+printk("%s - channel->mux.hw = 0x%08x\n", __func__, &channel->mux.hw);
+printk("%s - channel0->mux.hw = 0x%08x\n", __func__, &chan0->mux.hw);
 	if (channel->clk_parent) {
 		err = clk_set_parent(channel->clk, channel->clk_parent);
 		if (err < 0) {
@@ -434,6 +437,8 @@ static int meson_pwm_init_channels(struct meson_pwm *meson,
 			err = PTR_ERR(channel->clk);
 			dev_err(dev, "failed to register %s: %d\n", name, err);
 			return err;
+		} else {
+			dev_info(dev, "channel->mux.hw = 0x%08x\n", &channel->mux.hw);
 		}
 
 		snprintf(name, sizeof(name), "clkin%u", i);
@@ -456,8 +461,10 @@ static void meson_pwm_add_channels(struct meson_pwm *meson,
 {
 	unsigned int i;
 
-	for (i = 0; i < meson->chip.npwm; i++)
+	for (i = 0; i < meson->chip.npwm; i++) {
 		pwm_set_chip_data(&meson->chip.pwms[i], &channels[i]);
+		printk("%s(%d) = 0x%08x\n", __func__, i, &channels[i].mux.hw);
+	}
 }
 
 static int meson_pwm_probe(struct platform_device *pdev)
-------------- next part --------------
[    7.049250] Key type dns_resolver registered
[    7.053424] ThumbEE CPU extension supported.
[    7.057551] Registering SWP/SWPB emulation handler
[    7.063463] Btrfs loaded, crc32c=crc32c-generic
[    7.070151] clk_register(0xeddfbf80/0xeddfbf30//soc/cbus at c1100000/pwm at 86c0#mux0)
[    7.074250] __clk_core_init(0xeddfbf80/0xeddfbf30//soc/cbus at c1100000/pwm at 86c0#mux0) -> parent = 0xedabaf80/0xc1699ef0/xtal
[    7.085217] meson-pwm c11086c0.pwm: channel->mux.hw = 0xeddfbf30
[    7.091191] clk_register(0xedd22900/0xeddfbf74//soc/cbus at c1100000/pwm at 86c0#mux1)
[    7.098562] __clk_core_init(0xedd22900/0xeddfbf74//soc/cbus at c1100000/pwm at 86c0#mux1) -> parent = 0xedabaf80/0xc1699ef0/xtal
[    7.109569] meson-pwm c11086c0.pwm: channel->mux.hw = 0xeddfbf74
[    7.115608] meson_pwm_add_channels(0) = 0xeddfbf30
[    7.120305] meson_pwm_add_channels(1) = 0xeddfbf74
[    7.125912] dwc2 c9040000.usb: c9040000.usb supply vusb_d not found, using dummy regulator
[    7.133369] dwc2 c9040000.usb: c9040000.usb supply vusb_a not found, using dummy regulator
[    7.161902] dwc2 c9040000.usb: DWC OTG Controller
[    7.161944] dwc2 c9040000.usb: new USB bus registered, assigned bus number 1
[    7.168001] dwc2 c9040000.usb: irq 20, io mem 0xc9040000
[    7.173773] hub 1-0:1.0: USB hub found
[    7.177019] hub 1-0:1.0: 1 port detected
[    7.181938] dwc2 c90c0000.usb: c90c0000.usb supply vusb_d not found, using dummy regulator
[    7.189163] dwc2 c90c0000.usb: c90c0000.usb supply vusb_a not found, using dummy regulator
[    7.331850] dwc2 c90c0000.usb: DWC OTG Controller
[    7.331892] dwc2 c90c0000.usb: new USB bus registered, assigned bus number 2
[    7.337946] dwc2 c90c0000.usb: irq 21, io mem 0xc90c0000
[    7.343656] hub 2-0:1.0: USB hub found
[    7.346964] hub 2-0:1.0: 1 port detected
[    7.352647] meson_pwm_request - channel->mux.hw = 0xeddfbf74
[    7.356484] meson_pwm_request - channel0->mux.hw = 0xeddfbf30
[    7.362222] clk_core_set_parent(0xedd22900/0xeddfbf74//soc/cbus at c1100000/pwm at 86c0#mux1, fclk_div4)
[    7.372215] hctosys: unable to open rtc device (rtc0)
[    7.376338] clk_disable_unused_subtree(0xedabaf80/0xc1699ef0/xtal) - empty=0
[    7.383203] clk_disable_unused_subtree(0xeddfbf80/0x00000003/?) - empty=1
[    7.389947] Unable to handle kernel NULL pointer dereference at virtual address 00000018
[    7.398005] pgd = c0204000
[    7.400692] [00000018] *pgd=00000000
[    7.404248] Internal error: Oops: 17 [#1] SMP ARM
[    7.408927] Modules linked in:
[    7.411964] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.11.0-rc5+ #763
[    7.418462] Hardware name: Amlogic Meson platform
[    7.423143] task: c0250000 task.stack: c024c000
[    7.427658] PC is at clk_disable_unused_subtree+0xb0/0x118
[    7.433117] LR is at clk_enable_lock+0x20/0x104
[    7.437620] pc : [<c08e4728>]    lr : [<c08e2c40>]    psr: 600c0093
[    7.437620] sp : c024ded0  ip : 00000000  fp : 00000000
[    7.449061] r10: 00000008  r9 : 00000154  r8 : c14b283c
[    7.454262] r7 : c14b2838  r6 : 00000000  r5 : eddfbf80  r4 : 400c0013
[    7.460764] r3 : 00000000  r2 : 00000001  r1 : 00120011  r0 : 400c0013
[    7.467266] Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment none
[    7.474459] Control: 10c5387d  Table: 2dde804a  DAC: 00000051
[    7.480180] Process swapper/0 (pid: 1, stack limit = 0xc024c220)
[    7.486161] Stack: (0xc024ded0 to 0xc024e000)
[    7.490497] dec0:                                     f0f3c6c8 00000001 c12533c8 eddfbf80
[    7.498646] dee0: edabaf80 c08e46d0 c129d210 00000000 c1493760 edabaf80 c17c5828 c08e47c8
[    7.506794] df00: ffffe000 c08e4790 00000000 c0301e9c c0f0ba40 c021f980 00000000 c1634f04
[    7.514942] df20: c135525c c0f2b4c4 00000154 c035d304 c11b906c c13537cc 00000000 00000007
[    7.523090] df40: 00000007 c11cba78 c1634eec c172f000 c172f000 00000007 c172f000 c172f000
[    7.531238] df60: c15211c0 c14b283c 00000154 c1400dd0 00000007 00000007 00000000 c14005ac
[    7.539386] df80: 00000000 00000000 c0e8eba0 00000000 00000000 00000000 00000000 00000000
[    7.547534] dfa0: 00000000 c0e8eba8 00000000 c0307d38 00000000 00000000 00000000 00000000
[    7.555682] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    7.563830] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[    7.571986] [<c08e4728>] (clk_disable_unused_subtree) from [<c08e46d0>] (clk_disable_unused_subtree+0x58/0x118)
[    7.582036] [<c08e46d0>] (clk_disable_unused_subtree) from [<c08e47c8>] (clk_disable_unused+0x38/0x130)
[    7.591399] [<c08e47c8>] (clk_disable_unused) from [<c0301e9c>] (do_one_initcall+0x44/0x168)
[    7.599809] [<c0301e9c>] (do_one_initcall) from [<c1400dd0>] (kernel_init_freeable+0x160/0x1ec)
[    7.608477] [<c1400dd0>] (kernel_init_freeable) from [<c0e8eba8>] (kernel_init+0x8/0x110)
[    7.616625] [<c0e8eba8>] (kernel_init) from [<c0307d38>] (ret_from_fork+0x14/0x3c)
[    7.624163] Code: 1a000010 e28dd00c e8bd8030 e5953004 (e5933018) 
[    7.630233] ---[ end trace 59cd78c54eba76ec ]---
