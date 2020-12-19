Return-Path: <SRS0=kh+7=FX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C329EC4361B
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Dec 2020 19:54:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F62E238E8
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Dec 2020 19:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F62E238E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vFpnRw+eVvlqKP0ES4djaeppLOc9HxxS+RdffB9boso=; b=vUoBsirKgrEbSEGVAlWbZsg4m
	SOzqKTiu0IxYsmODWR39lZz7Zobu++S2+1HVSO1u0F1oJni+WzCmUVqmZ7Rwa8M9oSgjTvL20bblz
	PMxGzoxgYMcTndL5ZET4vk923bA2skZF1UUMLXsEujtPQpiL7/LojEPuBjCj+N9Ehb7OwNyX3W7/E
	HcThP8F1vp3kPN1c8uqLPKAPBrORCsviFa0jqtUUmjWYoGg9SsLTmsSNiJg8aDzj3cCnKBnBS3TKx
	PuKbu969B5s+Cym9M8xj8JQxqXnPsH7HliEVcaVjwydUz2i1XszWXULvHDKHF+GviI8ocRLzz9Nf6
	Xyx+QUf9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqiIe-0005VG-OC; Sat, 19 Dec 2020 19:53:56 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqiIY-0005S0-5C
 for linux-amlogic@lists.infradead.org; Sat, 19 Dec 2020 19:53:51 +0000
Received: by mail-yb1-xb34.google.com with SMTP id y128so5196209ybf.10
 for <linux-amlogic@lists.infradead.org>; Sat, 19 Dec 2020 11:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=da3V1/k7LJgLuPYzqWPIFxUVeadZkuLYghR+CceTzlw=;
 b=bkhri8oJG9zsn3UpF+Dbo0SgUK4v8wYmiOAg0zV8Xi0PpyqYgzbHd+qu/0K3ysBwSL
 KXweBOrzKJiim3iVEzkGR2mj6QRYZOmcqOHLWz6NKApyGD91CJsdNsbdcZRWDQm0UkC4
 S83nPliYx8yER026WKZpcIxv2XdzQKPgRig5jiApU7FaqqBu5BcmM1nWzvIrOOPCf6lb
 mMItA1m26dwyr+ThCAk6C9+h01BoNKswu1QThhHYgfroViY6G23bSQA3OFcXKexH907m
 +28YwL6wQNNI146nRJGuOu0k0vFlL4rfXvNZtxcrMvprXc79no/jAv+pCA3Qch6oXvk2
 Fotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=da3V1/k7LJgLuPYzqWPIFxUVeadZkuLYghR+CceTzlw=;
 b=B329x8U8UOcb5yHp741cqZjvyOySpaEyhRxsYFbN8tDDvHaOFd9rcD7dwOb3IwNZA3
 XkZjMzoAlBmK+9Z8uZQJHOkiBZ0s9C5z99hoA2hund58g0tR179mDREH8NlG1BlbfKEM
 Bh5zzCBGJqzkQZ1raVITasmiF2P11XbSEQ+n5xoKziJtRHSqJcjUKbc9NVDteK9O8MK5
 pHa0clPKYIlZYADtm0d8ErTlCNN+U7WJDTQxYlvpBUcl/PrpmP8EZHhXhqQUleoZKFi1
 6l+8OkuDntYMTP09xKbuhR1gL9lObbJP1KrdbJPw03eUcCcvcfZ3GfsvkAzO2JY+UGcY
 aLsA==
X-Gm-Message-State: AOAM5333fReauYcCp8GPACjIJQOKVHdSw6W1RkzoNCvim0MlvEjPDIS5
 c+8hcHO/+f+0YBtq3zyMRxD7tmgY1pC06BuSQYw=
X-Google-Smtp-Source: ABdhPJy8jC1hUk64Kqn3Badog/Yyf8caqxchikKDgkGejEOmRSQAmP5JLD+mKk6CXKz5tcb+/GmJVsMNQjPlK95VhYo=
X-Received: by 2002:a25:f02:: with SMTP id 2mr13151380ybp.500.1608407626575;
 Sat, 19 Dec 2020 11:53:46 -0800 (PST)
MIME-Version: 1.0
References: <c2dc3507-67a7-3c18-374f-050295bc1d59@gmx.net>
 <CAFBinCDrMj4GP2cy4dBSt_isGXf4CuhmDz=uAs+gZwUGQc=o6A@mail.gmail.com>
 <8afb2adb-4581-a847-e7e0-db1e915e9247@gmx.net>
 <CAFBinCD6aqna6YYvXgO5iKWa9N3yvqehhB+SAirLaUu3xScy2Q@mail.gmail.com>
 <bd9d96d2-8b66-db93-a855-5e179adca8c9@gmx.net>
 <0d05671d-b5f4-55e4-f5bd-58410cc92d08@baylibre.com>
 <dd160e55-55e9-1c41-afcb-22990a05a86b@gmx.net>
 <CAFBinCDv+TgEgf1g7xBTknr-aJMhC3K1wOW87-06YG4sQ9wUAg@mail.gmail.com>
 <531138bc-d343-1081-d208-ab6c98c1ddd8@gmx.net>
 <CAFBinCBoWGV02hF=0DK_geLpArDtm-qbAKCrXQitpb33UU_zYA@mail.gmail.com>
In-Reply-To: <CAFBinCBoWGV02hF=0DK_geLpArDtm-qbAKCrXQitpb33UU_zYA@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sun, 20 Dec 2020 01:23:37 +0530
Message-ID: <CANAwSgQuZbH_E7Kaxycu0vkTxzL-XqC3PneGKM3PpaPvwDQgDg@mail.gmail.com>
Subject: Re: [BUG]odroid-c2 does not hotplug usb-devices
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201219_145350_294767_CF7C08FE 
X-CRM114-Status: GOOD (  33.62  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 u-boot-amlogic@groups.io, Otto Meier <gf435@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

On Sat, 19 Dec 2020 at 19:29, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Otto,
>
> On Mon, Dec 14, 2020 at 8:34 PM Otto Meier <gf435@gmx.net> wrote:
> >
> > Hi Martin,
> >
> > Am 13.12.20 um 19:46 schrieb Martin Blumenstingl:
> > > Hi Otto,
> > >
> > > On Mon, Dec 7, 2020 at 1:43 PM Otto Meier <gf435@gmx.net> wrote:
> > > [...]
> > >>>> So with the latest u-boot and the kernel from https://github.com/chewitt/linux/tree/amlogic-5.10.y
> > >>>> commit 725fc8df7898102f9031ba2075f763884ffa3ee8 everything is working again.
> > >>>> USB does hotplugging as expected.
> > >>> So, this fixes USB under Linux ?? It's not clear
> > > if you have time it would be great if you could figure out which of
> > > the patches from Christian's tree fixes USB hotplugging for you.
> > > Or is it fixed in Linux 5.10-rcX even without any patches?
> > >
> > The new mainline kernel 5.10.0 from Linus, without any other patches
> > does detect USB hotpluging,
> > when using u-boot DMI: Hardkernel Co., Ltd. ODROID-C2/ODROID-C2, BIOS
> > 2021.01-rc3-00039-gec79f5ce22-dirty 12/08/2020
> > and the following u-boot patch:
> [...]
> > When i use the last unpatched emmc bootable u-boot 2020.04 the kernel
> > boots, but usb hotplugging
> > does not work.
> Thank you for testing this!
>
> > Hope this describes my findings. If i can help further, please give me a
> > note.
> to be honest: I am a bit lost here. I don't understand how the BOOT_*
> pins interfere with USB.
> I also don't have any Odroid-C2 board myself so I cannot do any
> experiments myself.
> Neil, please let me know if you have any idea here.
>
>
> Best regards,
> Martin
>

I was also looking into this issue so I made some changes in the
phy driver to resolve the issue. Plz share your thoughts on the changes below.

Best Regards
-Anand

amoon@ThinkPad-T440s:~/mainline/linux-aml-5.y-devel$ git diff
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 7c029f552a23..363dd2ac17e6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -20,6 +20,7 @@ usb0_phy: phy@c0000000 {
                        #phy-cells = <0>;
                        reg = <0x0 0xc0000000 0x0 0x20>;
                        resets = <&reset RESET_USB_OTG>;
+                       reset-names = "phy-reset";
                        clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB0>;
                        clock-names = "usb_general", "usb";
                        status = "disabled";
@@ -30,6 +31,7 @@ usb1_phy: phy@c0000020 {
                        #phy-cells = <0>;
                        reg = <0x0 0xc0000020 0x0 0x20>;
                        resets = <&reset RESET_USB_OTG>;
+                       reset-names = "phy-reset";
                        clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB1>;
                        clock-names = "usb_general", "usb";
                        status = "disabled";
diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c
b/drivers/phy/amlogic/phy-meson8b-usb2.c
index 03c061dd5f0d..31523becc878 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -143,14 +143,6 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
        u32 reg;
        int ret;

-       if (!IS_ERR_OR_NULL(priv->reset)) {
-               ret = reset_control_reset(priv->reset);
-               if (ret) {
-                       dev_err(&phy->dev, "Failed to trigger USB reset\n");
-                       return ret;
-               }
-       }
-
        ret = clk_prepare_enable(priv->clk_usb_general);
        if (ret) {
                dev_err(&phy->dev, "Failed to enable USB general clock\n");
@@ -222,9 +214,23 @@ static int phy_meson8b_usb2_power_off(struct phy *phy)
        return 0;
 }

+static int phy_meson8b_usb2_reset(struct phy *phy)
+{
+       struct phy_meson8b_usb2_priv *priv = phy_get_drvdata(phy);
+
+       if (priv->reset) {
+               reset_control_assert(priv->reset);
+               udelay(10);
+               reset_control_deassert(priv->reset);
+       }
+
+       return 0;
+}
+
 static const struct phy_ops phy_meson8b_usb2_ops = {
        .power_on       = phy_meson8b_usb2_power_on,
        .power_off      = phy_meson8b_usb2_power_off,
+       .reset          = phy_meson8b_usb2_reset,
        .owner          = THIS_MODULE,
 };

@@ -271,6 +277,10 @@ static int phy_meson8b_usb2_probe(struct
platform_device *pdev)
                return -EINVAL;
        }

+       priv->reset = of_reset_control_get_shared(pdev->dev.of_node,
"phy-reset");
+       if (IS_ERR(priv->reset))
+               priv->reset = NULL;
+
        phy = devm_phy_create(&pdev->dev, NULL, &phy_meson8b_usb2_ops);
        if (IS_ERR(phy)) {
                dev_err(&pdev->dev, "failed to create PHY\n");

> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
