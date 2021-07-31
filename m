Return-Path: <SRS0=ueWB=MX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE47C4338F
	for <linux-amlogic@archiver.kernel.org>; Sat, 31 Jul 2021 13:10:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14D6660FE7
	for <linux-amlogic@archiver.kernel.org>; Sat, 31 Jul 2021 13:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14D6660FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yandex.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:MIME-Version:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/FoZycxgpHi6+gbDUciZzLSFAVly93yGqQvBiIKZqg=; b=hJfX8merB/I4m3
	/Qr+AbIEPl5O7pUHoVUu5+gq3zuUyDejnFbAvktkfvdHHII110afEHDxlczxWEoVaB2LBv1FUudCz
	6US1FEamu2DLYHgPXFqKENxc4tZjB2xUnYbPydUBO2tlsy5+6tg5Csvk+a0MeyQ6XmdocekwgmHW4
	Pg1WaNqmcVGDYn/mYcmVanZYeWACpxRTWi/ej/WfAN+cChjjR+ZVn+0vqz+g7DCOg+/zaTVsrw3iD
	/Y5ue6G3rRerSFOGyfC2pVv/DGu3ne56oLVBX4scjTFdIEnpkqt3dKHUs42QlR4m3/Q2Csic7gAEK
	9L/fOLvQ936yrzZXytUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9okT-00Bg2u-PN; Sat, 31 Jul 2021 13:09:53 +0000
Received: from forward501p.mail.yandex.net ([2a02:6b8:0:1472:2741:0:8b7:120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1m9okP-00Bg24-O3
 for linux-amlogic@lists.infradead.org; Sat, 31 Jul 2021 13:09:51 +0000
Received: from myt6-f96510cd1fe5.qloud-c.yandex.net
 (myt6-f96510cd1fe5.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4e12:0:640:f965:10cd])
 by forward501p.mail.yandex.net (Yandex) with ESMTP id 2617E3500176;
 Sat, 31 Jul 2021 16:09:36 +0300 (MSK)
Received: from mail.yandex.ru (mail.yandex.ru [46.237.12.158])
 by myt6-f96510cd1fe5.qloud-c.yandex.net (mxback/Yandex) with HTTP id
 U9jd2J1H7W21-9YH04XLX; Sat, 31 Jul 2021 16:09:35 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1627736975; bh=f2b58DAAys5iq1Aqv4rWqdialEK3tJ/kaIDwTCsUChU=;
 h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
 b=dcZB5bQfF4P2tOvck2oqCO50ZDEDYRKmhHSfrFHdWmZCRiPxn3+anoso+hm4wml/M
 bUu1P6ZKrcPxBKMK60yjOuF0dx9dQLjjWmr0g3lXZPhqMZcUC3WR6LNOgcJm7d+oe2
 eBXSP4uHD7rBc2O98nNE9y0k11M/VeRPbjf5hrSk=
Authentication-Results: myt6-f96510cd1fe5.qloud-c.yandex.net;
 dkim=pass header.i=@yandex.ru
Received: by myt5-99d469eb3b26.qloud-c.yandex.net with HTTP;
 Sat, 31 Jul 2021 16:09:34 +0300
From: =?utf-8?B?0KTQtdC00L7RgNC+0LIg0JPRgNC40LPQvtGA0LjQuQ==?=
 <elektromonder@yandex.ru>
Envelope-From: elektromonder@yandex.ru
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
In-Reply-To: <6421c1c3-9a68-9364-9b99-aa4cf5f73d24@baylibre.com>
References: <8833871627419165@myt5-76cfa60c365b.qloud-c.yandex.net>
 <6421c1c3-9a68-9364-9b99-aa4cf5f73d24@baylibre.com>
Subject: Re:amlogic-meson-g12b USB does not work
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Sat, 31 Jul 2021 16:09:34 +0300
Message-Id: <24110871627736974@myt5-99d469eb3b26.qloud-c.yandex.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210731_060949_989425_B2021C20 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil! I do not have access to the source code of the vendor kernel. But there are free source code for this box, in which the USB works: https://github.com/CoreELEC/linux-amlogic/blob/amlogic-4.9-19/arch/arm64/boot/dts/amlogic/g12b_s922x_x88_king_rev_a.dts
I want to show you the differences in the DTS file of Coreelek and the mainline Linux.
Coreelek x88king dts:usb2phy@ffe09000 {
                compatible = "amlogic, amlogic-new-usb2-v2";
                status = "okay";
                reg = <0x00 0xffe09000 0x00 0x80 0x00 0xffd01008 0x00 0x100 0x00 0xff636000 0x00 0x2000 0x00 0xff63a000 0x00 0x2000>;
                pll-setting-1 = <0x9400414>;
                pll-setting-2 = <0x927e0000>;
                pll-setting-3 = <0xac5f69e5>;
                pll-setting-4 = <0xfe18>;
                pll-setting-5 = <0x8000fff>;
                pll-setting-6 = <0x78000>;
                pll-setting-7 = <0xe0004>;
                pll-setting-8 = <0xe000c>;
                portnum = <0x02>;
                phandle = <0x19>;
        };
linux mainline meson-g12b-s922x dts:

usb@ffe09000 {
                        status = "okay";
                        compatible = "amlogic,meson-g12a-usb-ctrl";
                        reg = <0x00 0xffe09000 0x00 0xa0>;
                        interrupts = <0x00 0x10 0x04>;
                        #address-cells = <0x02>;
                        #size-cells = <0x02>;
                        ranges;
                        clocks = <0x02 0x2f>;
                        resets = <0x05 0x22>;
                        dr_mode = "host";
                        phys = <0x44 0x45 0x06 0x04>;
                        phy-names = "usb2-phy0\0usb2-phy1\0usb3-phy0";
                        vbus-supply = <0x46>;
What is Pll-Setting? What rows of code relative to the USB drivers need to port from the Coreelek source, so that the USB driver is works in the main line Linux? Please pay attention to this problem, this board is very in demand, it turned out great potential in it, it should be revealed, giving it the opportunity to operate the core Linux mainline.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
