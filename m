Return-Path: <SRS0=M9gz=RF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8091BC43381
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 Mar 2019 10:29:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CD9520830
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 Mar 2019 10:29:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="di59YssM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="S6e3r1Ta"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CD9520830
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+EnX7dNRwf+Dl0nsUKs9OLdz8tjfHd2V7ab5tZIH6yI=; b=di59YssMB3mw9V
	BpwpsCi5ZJKd8ulltsLJmuGyfNFWoU2/wUjuyyxBTMpbSmMN98c60/1TMeAnkD0byuYlwXNEeaq7H
	BC8cUXEkroy+B64ltAERMkzf0CobW9zzCKbBvfJt+0LvJQP8RdMp3sehnGoYcgtO29CLRiOuocQJo
	+kDsu/OIwgUci7NYWvNq2ZGQtgPgPN9JiTu9jKfipDCfXLbBI+odCupZzKZ1PzcZg/y47SbdhNkzo
	tSHpEYv+pj9epb+au+6cM19qpjCrOaTn18A1wwA31UQkmUhMGzKZq4/im9PI4zAsPfL05B7cLR5ru
	X6Sptws4dlfd97LKtGEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h01tO-0001uD-IZ; Sat, 02 Mar 2019 10:29:18 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h01tL-0001tf-9Z; Sat, 02 Mar 2019 10:29:16 +0000
Received: by mail-oi1-x243.google.com with SMTP id t82so231140oie.12;
 Sat, 02 Mar 2019 02:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NFS8iN791dAHXkv5uIHJZIdjxpznm7Am3E/GPQELsSw=;
 b=S6e3r1TaBOfYkoTrY7OmY6W7HIJLC8/6YAnMog+h6K6fgxI7qKOQnk09xcw0zNoBpa
 eV535ci2yTLWRIiR4pXjRtJIicz7MlK2S7KoBsmB8R3VDYQ1Y7kWH+9Z1APu6TFEZIo2
 P5wuZ4vvbsz2oRt2tTOjh4Tsuu8LAfLaQL8/ejQ8/0cPjn4RKTpj6yizFDTDbuhpjTxN
 xoiH4ekIP/QQ5ThKFmKimVJVyvzILH9NtyfMfuhnulTM77UX/7r9ffB4j01HRdpAAfbo
 9uYf25Q4ZjhKXUlh5PSNwM++s0uVfcOvJSXgHJcQdAC+t2e8UnvjcQUfzVQ1yAzGp+Pk
 zSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NFS8iN791dAHXkv5uIHJZIdjxpznm7Am3E/GPQELsSw=;
 b=h0apJeQabp2+krd4QOQptIFjozBqqiEzk9sxb/ZjKfRirJHLCO7hrRwJORM9ehMFuy
 eQvDmNAAMrkD1XOjUJ4ioAVO/XYkk0FS36ZNsNyJip6rujQfaGqWMbBwwsKRcN/0vrf2
 6i2jOC2+WlDqIl4G2SNUGkGpTQI2BjWKeCoG6RuZao7J0Co5HiUXPNrpnlYFAVGysFur
 loe+YxiPNmqYeJVAMqWFou3YIaSG37hkszXkdEloG6cxjV5FrJJrawtsCEDDuHmP0OTy
 CVD7mI/86qVmqB113y/QqA7nypEwgYYhIWuvnQ/2JO4fAZqZFCg1H+CdbmSakuwfFrum
 T8mg==
X-Gm-Message-State: AHQUAubAIHzGN4WYbLoA6VSS9baKqsW5Wxu87uJSibL8zwGi6c9QDmYS
 m8cKm/GOjW66fOFts6rw1egwvQQAl0IhZ0JNqeg=
X-Google-Smtp-Source: AHgI3IYZdpDzaozOuPlNBcZ437nMyI3Gzf3CWXvrhZ3Ikqn98FHIX6LoGznlvanc5HCWvIhza2NzlldVe71vCKUoih8=
X-Received: by 2002:aca:aacb:: with SMTP id t194mr6283612oie.129.1551522553134; 
 Sat, 02 Mar 2019 02:29:13 -0800 (PST)
MIME-Version: 1.0
References: <20190212151413.24632-1-narmstrong@baylibre.com>
 <20190212151413.24632-9-narmstrong@baylibre.com>
 <CAFBinCBoahGTbnii0Dhfj75YC8u2HjodAqFWwtD=K3xOZ-wGPw@mail.gmail.com>
In-Reply-To: <CAFBinCBoahGTbnii0Dhfj75YC8u2HjodAqFWwtD=K3xOZ-wGPw@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 2 Mar 2019 11:29:01 +0100
Message-ID: <CAFBinCDjFJS58+6yqxrsyHvhycsg2sC4tTtRj8O=GkcPJpR5Tg@mail.gmail.com>
Subject: Re: [PATCH 8/8] usb: dwc3: Add Amlogic G12A DWC3 glue
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190302_022915_361157_4B3A8A71 
X-CRM114-Status: UNSURE (   7.82  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kishon@ti.com, hminas@synopsys.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

> > +static int dwc3_meson_g12a_debugfs_init(struct dwc3_meson_g12a *priv)
> > +{
> > +       priv->root = debugfs_create_dir("dwc3-meson-g12a", NULL);
> > +       if (IS_ERR(priv->root))
> > +               return PTR_ERR(priv->root);
> > +
> > +       debugfs_create_file("mode_force", 0600, priv->root, priv,
> > +                           &dwc3_meson_g12a_mode_force_fops);
> > +
> > +       debugfs_create_file("otg_id", 0400, priv->root, priv,
> > +                           &dwc3_meson_g12a_otg_id_fops);
> > +
> > +       return 0;
> > +}
I just stumbled across the "USB role switch framework", see [0]
it seems to provide a userspace API as well and two in-kernel drivers
are using this framework already
(drivers/usb/gadget/udc/renesas_usb3.c,
drivers/usb/roles/intel-xhci-usb-role-switch.c)


[0] https://elixir.bootlin.com/linux/v5.0-rc8/source/drivers/usb/roles/class.c#L246

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
