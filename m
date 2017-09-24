From: linus.luessing@c0d3.blue (Linus =?utf-8?Q?L=C3=BCssing?=)
Date: Sun, 24 Sep 2017 06:28:03 +0200
Subject: [PATCH] ARM: dts: meson: fixing USB support on Meson6, Meson8
 and Meson8b
In-Reply-To: <20170922115708.GA14806@ingrassia.epigenesys.com>
References: <20170922115708.GA14806@ingrassia.epigenesys.com>
Message-ID: <20170924042803.GC2604@otheros>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Fri, Sep 22, 2017 at 01:57:08PM +0200, Emiliano Ingrassia wrote:
> This patch fixes the Meson6, Meson8 and Meson8b USB controllers dts nodes
> which interrupts are level type instead of edge type.
> This avoids errors like "usb 1-1-port1: cannot reset (err = -110)" and
> similars on Odroid-C1+ board.
> 
> Fixes: e29b1cf87473 ("ARM: dts: meson: add USB support on Meson8 and Meson8b")
> 
> Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>

Hi Emiliano,

Yes! I can confirm that these two patches made me able to boot a
Debian unstable from a USB stick on an Odroid C1+ for the first time.
I tested both a v4.13.2 kernel and a v4.14-rc1 with the SMP
patches included.


I'm having one oddity with the stress-ng tool though: Several
filesystem related tests make the Odroid hang for me. This works for
me:

$ cd /tmp/; time stress-ng -v --class filesystem --sequential 1 --exclude copy-file -t 30s
(with /tmp being a tmpfs)

Those tests make the system hang for me almost immediately, though:

$ cd ~/; time stress-ng -v -t 30s --chdir 1
$ cd ~/; time stress-ng -v -t 30s --dir 1
$ cd ~/; time stress-ng -v -t 30s --dirdeep 1
$ cd ~/; time stress-ng -v -t 30s --fallocate 1
$ cd ~/; time stress-ng -v -t 30s --mknod 1
$ cd ~/; time stress-ng -v -t 30s --sync-file 1
$ cd ~/; time stress-ng -v -t 30s --xattr 1

Unfortunately, there is no error message on my serial console
then, it just hangs silently with the heartbeat LED stopping to
blink.

I also tried:

* Using a USB connected hdd instead of the USB flash drive, with
  an actively powered USB hub in between.
* Using a clean v4.13.2 with the patched v4.14-rc1 DTB file
  instead of v4.14-rc1 kernel (with the SMP patches included).

Both without success. I also experienced a two freezes while
apt-get installing a few patches.

Anyone having an idea how I could make those crashes more
verbose or what else I could try? Or could it be that it freezes
so silently due to some sort of internal power issues? (I got a
little paranoid with power stuff since the confirmed,
hardware related power issues on the Odroid U3)

Regards, Linus
