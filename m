Return-Path: <SRS0=ig9A=VV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1340C76186
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jul 2019 17:55:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0B8A21852
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jul 2019 17:55:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rmMzgQbm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rjZl8Cha"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0B8A21852
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vw8EBU5Q23rdPESHptq1tEOJAkkH99RIjkpVJdmhCFM=; b=rmMzgQbm1/wUrP
	EJ9umn3CyAEKckIXBn+TPbmiL75iDxtO2hQZZMRbRxBi+7mhLN3Fr2GW4oGNihQ3wY9xqATWX3Oow
	HgB9olT18R9hIsbw9hNW7AThVYPKMVmls1sH+VeEu3vCaWi3daULPg7kmBFM4PkPhbzcgeo0QSaF+
	0mB2N9BgqPcxvYdhfB1LPA9nxJymtv75oVLinjzxAEIT8oIigTzIVtAa43hPOpPp4VSrw1ERfxHOi
	2J5GnBgFqH9yvyF/9q/Tl6aFfvQGcJJEYPv0fXTO5j2hioEv5tC/pgLRIzLU8iRK1yutCF43/GVNi
	8cx/9X3jwmjw8wKKAa9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqLTn-0003Bv-Rk; Wed, 24 Jul 2019 17:55:07 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqLTl-0002lH-9F
 for linux-amlogic@lists.infradead.org; Wed, 24 Jul 2019 17:55:06 +0000
Received: by mail-io1-xd30.google.com with SMTP id h6so4898200iom.7
 for <linux-amlogic@lists.infradead.org>; Wed, 24 Jul 2019 10:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+5E/GZL5B2buWnx/y48sXRGs40mtz4QBlYTrkYd6JQ8=;
 b=rjZl8ChaBV5+7XDjgRkUreZZ/QlrrYjAimsTDpCoI2WxC2GTFqm9DPnVyNqTHJ/kMl
 euFJoDtBWorPcT+ygEoBO2/gJbAyO4YXryXwcRJrQ2pjheWwR/C/Jo1WQJtpYcMe5qpd
 lRZVgOQqN304Z9Ogs/0xPRlb8aNl65ye+10WtdB2qVtNc/6EfR8zB5oG3Glje4+8uoXr
 /fJiM4Od1ToVve7onPxiRI8XeFmTJftNbq5S6IVIqlytc884epNqTfwMnwzrgX4PKoVk
 VS0/Vs1bgKp4VahDUVAuEoOe8ZqhNG6x8Y6nQa9qX19DF4hBTcvjR6kkj267U+h6m+YR
 2a8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+5E/GZL5B2buWnx/y48sXRGs40mtz4QBlYTrkYd6JQ8=;
 b=fcxYrzMe8o3hTSYO4lFAWSkcIvlNGnFLQCtHKW/HGc4RPxAPmksfqcdeGkrKBuEe1i
 gomlMMrF0uL7e+bSqHosdDgLnrKWnBfQTAIXG8T40VP6mdua5ZnmhWtWQR9P8ZKhTnLW
 2eOhOxwf5ltiHO08TEKEbmtEAU1EpIdqCmSbA8tkBgo2sjItpphuhRdL3XuGtj6QKTgm
 xt8Pvr1NsO/mfSW8A4mCOjTKv7oRLcY7JF3OFnamC0jwJkyvGq+E64l9yOSPxbditi4R
 hzbPUhDxGoq9yyQTJ4YRu5XMfSLEEZ+Bues2fMBCAVxZ0uQNABWo+QzujwwVeMVFy2i5
 gaig==
X-Gm-Message-State: APjAAAUjhiH7PZfwcwAGuh4sUUk8wkdW1+1izVA1Ow6hcb2i8rZyhal0
 is/1AsPirAroPNaeXVputGkd28T/cp1Ez6pNbKYOpDTV5lw=
X-Google-Smtp-Source: APXvYqx44aEp7l5mWe3tAEIgy4WBYZwjXaWn2qc94hbdDP+24WEE9EnYv7Hd5Z+gjlThcnqNwD9cTjUWiqBNrvpUcIo=
X-Received: by 2002:a5e:9b05:: with SMTP id j5mr14891697iok.75.1563990904275; 
 Wed, 24 Jul 2019 10:55:04 -0700 (PDT)
MIME-Version: 1.0
References: <CANAwSgQqJn8PBUJGWk2ew1RT1Df_-uyHoA5ECovTG632EnS=rQ@mail.gmail.com>
 <99a6ca7a-3100-975f-c7a6-aaec04199719@baylibre.com>
 <CANAwSgScwahG8u-C6kRktDShezAS9D0o42HUkPnScRxhJEAAbA@mail.gmail.com>
 <CANAwSgQOaPmuYC6HQ-mPpCn_h98nvrX7_F7zy790NPdh0U=Fsg@mail.gmail.com>
 <7hpnn0oxqe.fsf@baylibre.com>
 <CANAwSgQXJE=aq0bPdmgaKfnjA1oBZisLgpYGWjqeM=Zqsyi0Xw@mail.gmail.com>
In-Reply-To: <CANAwSgQXJE=aq0bPdmgaKfnjA1oBZisLgpYGWjqeM=Zqsyi0Xw@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 24 Jul 2019 23:24:52 +0530
Message-ID: <CANAwSgTLDuBjBFuSTMh_AaZjWfZX=yzjTL7NxUBv-qjNjUp1zw@mail.gmail.com>
Subject: Re: Odroid-N2 on archlinux cannot boot on using linux-next on sd_card
 / emmc
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190724_105505_376424_F285673F 
X-CRM114-Status: UNSURE (   5.83  )
X-CRM114-Notice: Please train this message.
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

[Ship]

Sorry for not following on my query on not able to boot from microSD
card on Odroid N2.
I have been trying various changes in *meson-g12b-odroid-n2.dts* most
of them related
to linking the power to tflash_vdd and tf_io nodes.

From the schematics it seems
tflash_vdd (TFLASH_VDD_EN)   vin-supply = <&vddao_3v3>;
tf_io (TF_3V3N_1V8_EN)           vin-supply = <&vcc_5v>;

but it seen some thing core is missing in Initialization of tf_io.

Below regulator_summary confirm my finding ft_io not linked to any
main regulator.

[root@alarm ~]# cat /sys/kernel/debug/regulator/regulator_summary
 regulator                      use open bypass  opmode voltage
current     min     max
---------------------------------------------------------------------------------------
 regulator-dummy                  1    2      0 unknown     0mV
0mA     0mV     0mV
    ff400000.usb                  0
0mA     0mV     0mV
    ff400000.usb                  0
0mA     0mV     0mV
 12V                              3    2      0 unknown 12000mV
0mA 12000mV 12000mV
    5V                            4    4      0 unknown  5000mV
0mA  5000mV  5000mV
       ff600000.hdmi-tx           1
0mA     0mV     0mV
       phy-ff636000.phy.0         1
0mA     0mV     0mV
       HUB_5V                     1    1      0 unknown  5000mV
0mA  5000mV  5000mV
          phy-ff63a000.phy.1      1
0mA     0mV     0mV
       USB_PWR_EN                 0    1      0 unknown  5000mV
0mA  5000mV  5000mV
          ffe09000.usb            0
0mA     0mV     0mV
    VDDAO_3V3                     3    2      0 unknown  3300mV
0mA  3300mV  3300mV
       VCC_3V3                    4    3      0 unknown  3300mV
0mA  3300mV  3300mV
          ffe07000.mmc            1
0mA  3300mV  3400mV
          FLASH_1V8               2    1      0 unknown  1800mV
0mA  1800mV  1800mV
             ffe07000.mmc         1
0mA  1800mV  1950mV
          VCC_1V8                 1    0      0 unknown  1800mV
0mA  1800mV  1800mV
       VDDAO_1V8                  1    0      0 unknown  1800mV
0mA  1800mV  1800mV
 TFLASH_VDD                       0    1      0 unknown  3300mV
0mA  3300mV  3300mV
    ffe05000.sd                   0
0mA  3300mV  3400mV
 TF_IO                            0    1      0 unknown  3300mV
0mA  1800mV  3300mV
    ffe05000.sd                   0
0mA  3300mV  3300mV

Also I could not figure out how Hardkernel (Amlogic) source code
initialize the power for regulator.
If you could share some input I will then try to debug this future.

Best Regards
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
