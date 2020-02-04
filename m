Return-Path: <SRS0=WvKJ=3Y=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7626C2D0B1
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Feb 2020 12:28:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BB0F2084E
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Feb 2020 12:28:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VaSlXIMR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="h1PowKXg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BB0F2084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0os6uMwOy8DAqnzHx9PNKtpGv8UtDk1DvtMA4ljhPNo=; b=VaSlXIMRP18+tE
	BXLd/e+rJz+7Yqn2g5dI1ssk8KAmfn0LtauctoUh27XOCO803pM5GLSMI4gtrsY2mESGN9Z4v4AMB
	vS/0VCmzjtPhgW3oqIijmvTZLAx7ISrH1Y4CPHKOehJUivnsZ7piTriaSESL710bfh1JgdJkJEwul
	Xd/rjgAKbeWxuIK3P8IdeZLCX89Crn7Bv5kzap6sLwPQSakektWIYIWNqGToTy9WtxttPVXt/VXo6
	WBJ2PTf/UQvZU6RO1dMspwZLsrZC8kRn45F3d5FV5t2gqCS0m4sqHjOL+rB/9qRNHmDiVmL4bhzpO
	bn4UsynMe6HyAkGPjEZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyxJ4-0002mV-Ej; Tue, 04 Feb 2020 12:27:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyxJ1-0002lz-FM
 for linux-amlogic@lists.infradead.org; Tue, 04 Feb 2020 12:27:52 +0000
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F5892084E
 for <linux-amlogic@lists.infradead.org>; Tue,  4 Feb 2020 12:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580819270;
 bh=u/sG3pj/xrBPOqKGj1oMg1PArSPocmrcd7koIK36ZHY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=h1PowKXg/z5OiQNMtFHtv2wgAXDvwnkPl/N43zuJdRTWjgbIz0WU4hn3oHj+DrUxp
 xSjqQEK+eTtKxkn5PgO6kBwKXUqb5IODKbIw4IgZpvwbPIPxNaN2R5i6Z30IzbP7zs
 RJAZsCGGkVoNNhMY0Z8gwFYsbg46ICOmWdueeua4=
Received: by mail-io1-f41.google.com with SMTP id d15so20713534iog.3
 for <linux-amlogic@lists.infradead.org>; Tue, 04 Feb 2020 04:27:50 -0800 (PST)
X-Gm-Message-State: APjAAAV5W4OYDS5QqaycLOZ/ZydIfHjwM8FKXgNR68P6JlZ70nj1uIFJ
 YJdkj18jg0zASWrX+aaRUofGYwrio1vwznJG5Yc=
X-Google-Smtp-Source: APXvYqw2sewP65Bm/QoI+CY7k5+glXny2PBt1ZdoajKIUprfZ0MZY3p10U0IXrIbFDcIx69Q69fRsJ9Pd6UNfNM3gVU=
X-Received: by 2002:a6b:cd0e:: with SMTP id d14mr22650528iog.272.1580819269631; 
 Tue, 04 Feb 2020 04:27:49 -0800 (PST)
MIME-Version: 1.0
References: <20200203153735.14674-1-mjourdan@baylibre.com>
In-Reply-To: <20200203153735.14674-1-mjourdan@baylibre.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 4 Feb 2020 07:26:24 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5+RdvvDt-+zCdza0CnJpneHsVPc9k0eVLH9=OThDwYNw@mail.gmail.com>
Message-ID: <CA+5PVA5+RdvvDt-+zCdza0CnJpneHsVPc9k0eVLH9=OThDwYNw@mail.gmail.com>
Subject: Re: [GIT PULL] amlogic: update video decoder firmwares
To: Maxime Jourdan <mjourdan@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200204_042751_535866_839ACB8C 
X-CRM114-Status: GOOD (  16.69  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Linux Firmware <linux-firmware@kernel.org>, Arden Jin <Arden.Jin@amlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Feb 3, 2020 at 10:37 AM Maxime Jourdan <mjourdan@baylibre.com> wrote:
>
> Hello linux-firmware maintainers,
>
> This pull request contains 1 commit that updates existing firmwares for
> the Amlogic video decoder, as well as adding 4 new ones for new chipsets
> and/or codecs. The support for which is in the process of upstreaming
> kernel-side.
>
> More details can be found in the single commit description.
>
> Regards,
> Maxime
>
> The following changes since commit 6d9f39910215a7dc56df3629e7d46b71a592be8e:
>
>   amdgpu: add renoir firmware for 19.50 (2020-02-03 07:26:39 -0500)
>
> are available in the Git repository at:
>
>   https://github.com/Elyotna/linux-firmware.git amlogic-vdec
>
> for you to fetch changes up to fb505a691b2a37b9d1fc20617433dfd52fb6e27e:
>
>   amlogic: update video decoder firmwares (2020-02-03 16:20:05 +0100)
>
> ----------------------------------------------------------------
> Maxime Jourdan (1):
>       amlogic: update video decoder firmwares
>
>  WHENCE                       |   4 ++++
>  meson/vdec/g12a_hevc_mmu.bin | Bin 0 -> 16384 bytes
>  meson/vdec/g12a_vp9.bin      | Bin 16384 -> 16384 bytes
>  meson/vdec/gxl_h264.bin      | Bin 36864 -> 36864 bytes
>  meson/vdec/gxl_hevc.bin      | Bin 16384 -> 16384 bytes
>  meson/vdec/gxl_hevc_mmu.bin  | Bin 16384 -> 16384 bytes
>  meson/vdec/gxl_mjpeg.bin     | Bin 16384 -> 16384 bytes
>  meson/vdec/gxl_mpeg12.bin    | Bin 16384 -> 16384 bytes
>  meson/vdec/gxl_vp9.bin       | Bin 0 -> 16384 bytes
>  meson/vdec/gxm_h264.bin      | Bin 36864 -> 36864 bytes
>  meson/vdec/sm1_hevc_mmu.bin  | Bin 0 -> 16384 bytes
>  meson/vdec/sm1_vp9_mmu.bin   | Bin 0 -> 16384 bytes
>  12 files changed, 4 insertions(+)
>  create mode 100644 meson/vdec/g12a_hevc_mmu.bin
>  create mode 100644 meson/vdec/gxl_vp9.bin
>  create mode 100644 meson/vdec/sm1_hevc_mmu.bin
>  create mode 100644 meson/vdec/sm1_vp9_mmu.bin

Pulled and pushed out.

josh

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
