Return-Path: <SRS0=lQ9R=V7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92805C433FF
	for <linux-amlogic@archiver.kernel.org>; Sat,  3 Aug 2019 18:50:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 610232073D
	for <linux-amlogic@archiver.kernel.org>; Sat,  3 Aug 2019 18:50:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aopWjxAP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="VntitNls"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 610232073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EanRQ40xMWDOH1ejmbqXaT7q355/m2bOn03KpRmHPmg=; b=aopWjxAPN4b42d
	oG7icENCrqKX6+ZTDm7VFRsa8hQ+XIdWm2LNKQyg6Qpta2S4sm5lSXadCi3TGiJHzGVhKoTlo7qT/
	VMgheUz89iNjPIgKREYk0/zUBY5jM/dN2ye/h0ozgNOgXGGFNbH+2a3taf+87PI43ArMp654A6tD2
	g7wARVsz5FLBg/mC0w1ra9esjFiHzZ38WzG6y5RFdb9b90mlhynWxBJOCgU0Jk2szuvBSCLv1q2XC
	nzl4c/flYQxx1WOHcJhHT1f22UOLKdNvCdsSylDmEjAGE6RO1Y8lXmzk+Avp6/kv4l2DLGss53x9R
	s+nRuLlWqDhepUH75QOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htz6x-0008Ad-BI; Sat, 03 Aug 2019 18:50:35 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htz6u-00085O-Kx; Sat, 03 Aug 2019 18:50:33 +0000
Received: by mail-ot1-x342.google.com with SMTP id z23so53136904ote.13;
 Sat, 03 Aug 2019 11:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b9mbEKIVTR3rX3ubtzGIZrWOdTZFbd/rUfMNEZjb2L8=;
 b=VntitNls0mHbGzOMlt+i+UvbChblh92q/PPvM5C6UgtsjPJ8PRDMq+eIomOgT0xR2I
 V1l+xCSc1i4EkT3IBbhuerju6/UyCbjQXggP5UJNcLAFcFVdFP+kv0ClgrJrO9hn/2JP
 jh8+r1WQq2yIrUVBQx17AuRbW+5Sf99tj3gA72p0dfAOv2EXkOfuvfdjtFusopnu214S
 RH8SKnvENBLxdk3iAH2G3YvVGZ9kzAwTqZx2/jHl4LV9pB9TNOIeqxefRR2Sy4Q1mHof
 hvlL5sHDJV8z4AFTHpBuHNWga0BPUuz9elNC4E5pblZoFMxUL3u/DGdN2FrDmEvIZYmm
 bwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b9mbEKIVTR3rX3ubtzGIZrWOdTZFbd/rUfMNEZjb2L8=;
 b=TrmEYBUHPwhQwu043yz3LFakzfH/JxE2m7OlYwou3xxCSYcbm9edYLcIGc1VE86Px7
 o76onUl9Z640WcssGp3ybzwy33NI9P5AHhWGdTsdkwGt/bSKE6SEc+CucXgx/3PKRUJE
 ZoQflMhw1xNqLMwpY0ue3aDW2OZh6BKGlZnY+i2K+Z2damLYwEPgoj/JFesp9jygqa5e
 9rRECPuWF0WO/2M5SVxWSL6yK78q98RzkmD4dJxXMMnHHXHJ5eiiam6abTgIMktgRRWQ
 VYSlXFu8VLWJblBdeXqxyGrbolnw52FMgJ3qwuzivnm40xq2hQaGDeWpuyu6JJc9Ipdz
 703Q==
X-Gm-Message-State: APjAAAV1u+pBhsFRjl8aAf3Wgj+uT3tvH550vIce/g9n7FxKD7/uhMkI
 nqMcFJDD9sZmeRK7XlN5TmzVQoFgtKEy3XTLgZs=
X-Google-Smtp-Source: APXvYqx87Oonv7Txg2sa97Z+ShM9V1yVGyAf6/UIiu/oSv9ZcRopmssHB10WSoofKJKze3Y1SED6u/5b/hbNxXNNOnM=
X-Received: by 2002:a9d:6d8d:: with SMTP id x13mr36845346otp.6.1564858231216; 
 Sat, 03 Aug 2019 11:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190731124000.22072-1-narmstrong@baylibre.com>
 <20190731124000.22072-7-narmstrong@baylibre.com>
In-Reply-To: <20190731124000.22072-7-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 3 Aug 2019 20:50:20 +0200
Message-ID: <CAFBinCAD6F=bEE8Z2MvNZLJVKZ3siPqdJ36GuCYkp=DuY3AecQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: meson-g12b-khadas-vim3: add initial
 device-tree
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190803_115032_715843_E0C503B0 
X-CRM114-Status: UNSURE (   8.05  )
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
Cc: khilman@baylibre.com, Christian Hewitt <christianshewitt@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Jul 31, 2019 at 2:44 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> +       memory@0 {
> +               device_type = "memory";
> +               reg = <0x0 0x0 0x0 0x40000000>;
nit-pick: we typically use the memory size used in the board size with
the lowest amount of RAM - 2GiB in this case. so I would change it to
0x80000000

[...]
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               white {
> +                       label = "vim3:white";
downstream sources use label="sys_led"
should we call it vim3:white:sys?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
