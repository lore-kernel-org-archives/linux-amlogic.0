Return-Path: <SRS0=C9TS=WX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00638C3A5A6
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 22:24:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9FDE217F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 22:24:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QSKJygAe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="F+EjFb8m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9FDE217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qUPf6RTFSE+BH0gxupwZazyR5HfKU3S3nDio0qMETFE=; b=QSKJygAet1xaPm
	U9lLfAyIsSuUtV5dfZqBkLxML0/2zA741nnsXQoqgZGQhdCe88S3/Fef/F4JFKmwTQ4gghHtaTOB2
	tluSpE6IyqmlgIU/OXOsNbnfbrMjhHpx2mupghtTu3F6twT/Ni2hISqvH0bgMv5r25uxrGepKNKex
	kFXk7Lo/dcqOLCcvJBdeXtWZkXF46R8VuzDlDGj8Pf/5WPN59pjBqQv2XX7nbP4N1LoEBopTRnd/c
	VrS/pIxY5KQv4whgOe/lj9O21h7E9fC2VcbgB31XnZbx5nlwJLZ3L6cJlsHLcAPVKQRtAaD/P+yTr
	Yglm0CbM9X+/Umnlx46A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2jt2-0008Js-RI; Tue, 27 Aug 2019 22:24:24 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2jsq-0008D7-BN
 for linux-amlogic@lists.infradead.org; Tue, 27 Aug 2019 22:24:14 +0000
Received: by mail-pf1-x443.google.com with SMTP id g2so319458pfq.0
 for <linux-amlogic@lists.infradead.org>; Tue, 27 Aug 2019 15:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=vCX5b31iY8wVKWn4s0MiMbZnH0WhFm1gAfks1OXyHmA=;
 b=F+EjFb8mnDRedjegmCbjOeCNiw919VuMRS1FKW3wGCXia8C4iKHKjDFThdV6YyAepH
 IVxQKZBtOjFgT0DVcbfw0yvET5QE2z4FPf5b0EiriI4ohsgDMXB2xXfkaS6dZOtviPRl
 ewk7TlBPUAIOYOsGvyzenlF2UoYhChVGU9EW4i6+Hw8fLjfKoD9kqtw+D4z9J3w/9iaX
 AyM/gejkEBTGy+AGHf1SALhYnvs44Gnc/RDa1yQkKXX3ON/LH+VILy/+3PPo+HigkX2q
 Wf12xyWgkf6oNs7VoBquCPVKLz1lH7XgGxdvcq2f/rQLw4WqoajzaCI/hgjcY8AeBJLg
 V4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=vCX5b31iY8wVKWn4s0MiMbZnH0WhFm1gAfks1OXyHmA=;
 b=LSgrT0B35vpjDdVRulC9mtKL1LTi1BXEVi/6/5gkiDwW5U9hgkgkTMdYIR47aJ8AO/
 QeLOJm5jrTVj7+PtOKOcO1lftCMPNB8JDZQJmB1k+15oebj+hVVnl5Chbpk5Whsz281N
 qZKGokmtvaHWAiVYNZaurWt6bwqGeLoi19t6EwTbvmMLbrV+JgD6yoDOHojk351sw++h
 ckGFKjFQhdNZGdHUIa8Wz9yyi/2UOuzFICVPUhwMlnT2qJ/hYNarhfGsBDhWD9/GSzRG
 PU2t+DPAWvKtggFCizJSiWJMLoSOQOhW+a3ibdsH8jKZqBdST+TbCJ2ItovcTWYvHdqN
 LWBw==
X-Gm-Message-State: APjAAAW1tduUxzj0nV6a3X0thqXhkAMMyvhzx4e62JhXZWez4h31sAZx
 k2sCYbixz6DIAHmUmkQHDIlnjA==
X-Google-Smtp-Source: APXvYqxx1tZzErI7XJVc/UYjGuLNFMxrAtv5a6h2jHs+k/r7nNepgGtzkViHmUpx9AdKzhbPP5zTnA==
X-Received: by 2002:aa7:9edc:: with SMTP id r28mr860234pfq.219.1566944651789; 
 Tue, 27 Aug 2019 15:24:11 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:cc35:e750:308e:47f])
 by smtp.gmail.com with ESMTPSA id e21sm327759pfi.13.2019.08.27.15.24.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 27 Aug 2019 15:24:11 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH 0/7] arm64: dts: meson: ir keymap updates
In-Reply-To: <CAFBinCD0uhE9Fj1we2MkaTbk7RwtmKh7Fn1C-2nn9wiWqCoNfg@mail.gmail.com>
References: <1566705688-18442-1-git-send-email-christianshewitt@gmail.com>
 <CAFBinCD0uhE9Fj1we2MkaTbk7RwtmKh7Fn1C-2nn9wiWqCoNfg@mail.gmail.com>
Date: Tue, 27 Aug 2019 15:24:10 -0700
Message-ID: <7h7e6yuu0l.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_152412_756715_65BA3F4A 
X-CRM114-Status: UNSURE (   7.96  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> On Sun, Aug 25, 2019 at 6:03 AM Christian Hewitt
> <christianshewitt@gmail.com> wrote:
>>
>> This series adds keymaps for several box/board vendor IR remote devices
>> to respective device-tree files. The keymaps were submitted in [0] and
>> have been queued for inclusion in Linux 5.4.
>>
>> The Khadas remote change swaps the rc-geekbox keymap for rc-khadas. The
>> Geekbox branded remote was only sold for a brief period when VIM(1) was
>> a new device. The Khadas branded remote that replaced it exchanged the
>> Geekbox full-screen key for an Android mouse button using a different IR
>> keycode. The rc-khadas keymap supports the mouse button keycode and maps
>> it to KEY_MUTE.
>>
>> [0] https://patchwork.kernel.org/project/linux-media/list/?series=160309
>>
>> Christian Hewitt (7):
>>   arm64: dts: meson-g12b-odroid-n2: add rc-odroid keymap
>>   arm64: dts: meson-g12a-x96-max: add rc-x96max keymap
>>   arm64: dts: meson-gxbb-wetek-hub: add rc-wetek-hub keymap
>>   arm64: dts: meson-gxbb-wetek-play2: add rc-wetek-play2 keymap
>>   arm64: dts: meson-gxl-s905x-khadas-vim: use rc-khadas keymap
>>   arm64: dts: meson-gxl-s905w-tx3-mini: add rc-tx3mini keymap
>>   arm64: dts: meson-gxm-khadas-vim2: use rc-khadas keymap
>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Queued for v5.4 w/Martin's tag,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
