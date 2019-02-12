Return-Path: <SRS0=SW07=QT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A211CC282C4
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Feb 2019 14:43:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F9542083B
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Feb 2019 14:43:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="satti9tM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pSl3zbne"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F9542083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tHcB5cHXBoWhUXeOvc+WWj5VnMlj6rFVePqEOqgRiKk=; b=satti9tMA/+zAs
	Ouv+wwQSIoiIYXoAHrsGHeUHN856Ep9UAzWHojd0iCGPZLnTkBL+tDPCHuXxvA7aLCNMQLQp+ztYM
	KH7PgOS2+WHBjzr5wYw/AXwdvYg2o2MdAym6w4ptlCtd63Wr8q/Zvy11rxXfu6nHglvlcMUTvndya
	CBGG0CPlt4DyGwiEea8d8zfTxN+dmVTpc7axDvBTevoa4gIO3ku9/SyZP5sy3wwKe+m4m9SlQJfuq
	7Ch1qSwl5J/vW8U2laF5v7PMjcf7qYo35VmRbIuJedBDj6TCFPXfPP9Arh71+t5tdOkT/rN6iGVWs
	6nTQOlCjIHEgAZk27rbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtZHC-0003lw-44; Tue, 12 Feb 2019 14:43:10 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtZH8-0003ks-Ti
 for linux-amlogic@lists.infradead.org; Tue, 12 Feb 2019 14:43:08 +0000
Received: by mail-wm1-x342.google.com with SMTP id f16so3280713wmh.4
 for <linux-amlogic@lists.infradead.org>; Tue, 12 Feb 2019 06:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=ZUy0VCT1WuGXUG1KTNtWcsxFWdFXTWKSDbOTngrZcLA=;
 b=pSl3zbne4W+iYHTH/1UEv8dQigHTIrlQKSWlB+wcwUo1j7DDzFS4nHlCbmqPMSgUhq
 Lpt+B6jdgBlgyz2bXqcnse+XbxYmBSWdV039c5Kt+6KJcGCduiccf9vrtmHD3hDbGOJd
 fBPShB9QVyu18wD7dQW0pCRlsS+5ZWTDU+jc7E4ixXpLicp3+BN66cET0P32RIlEIUzn
 HJfDZnpl2qz+VSo7zLm5LvdVhTjLdI1BxYYHzekOAmKRdu9DVZf6VyA6ILuxJ/d8KD/5
 kOqc94+TY8oVn1ovW+8exY9572Ju6As+CWegMag95Ws9akJ3B++j4OjzB3fGqsnJk+um
 HCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=ZUy0VCT1WuGXUG1KTNtWcsxFWdFXTWKSDbOTngrZcLA=;
 b=nyFIHy7LjUuNBd7NxB9K0576fwiEmU0Z+Wr70r3lJRlGK117NqSz253MJwXVvbsEQt
 By893JMgfQGGcWjFX+SjceykWf+M3TusOx0iSoVLhSb4+DpsYb56H/P+5OwulSnvR2EQ
 nAHdcvLmBv5+NMJBvkqMNnPj3X8vrNo/3CGqVkclJvqnsgCgRD79VTfY9U0HiS3DBAG/
 929mkalgv4o7w9iKxAn1rT8FqfaaoZ+zRf9H6hvJOZRwXOsZK0SnTdi+4AEpBk97Zmxa
 5Ob3eYBJabKyTuh1/SHM7FriJdoUTZBp690fVZChFubjh2ite6qzCIBg7ffbChobuscD
 hELQ==
X-Gm-Message-State: AHQUAubhcL+aa1/YBbeCLisamnYmM3CNjRQNeembdmOE3wcPClm9QeuJ
 RPNgOgD5Z9UwUacsXvjO1BGZJw==
X-Google-Smtp-Source: AHgI3IbuPmVopWs3+dKFaWZNzP7k1eAL4Y4UJqGV0lgkEf5b9kk8sUNznwx/d7GxtOfT8shboocq0g==
X-Received: by 2002:a1c:2358:: with SMTP id j85mr2972336wmj.130.1549982583020; 
 Tue, 12 Feb 2019 06:43:03 -0800 (PST)
Received: from boomer.baylibre.com
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e9sm25037122wrc.56.2019.02.12.06.43.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 12 Feb 2019 06:43:02 -0800 (PST)
Message-ID: <a2475cc2b0de8a13bc103ef6f4157a4a569c4a6c.camel@baylibre.com>
Subject: Re: [PATCH 2/3] soc: amlogic: gx-socinfo: Add new SoC IDs and
 Packages IDs
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com
Date: Tue, 12 Feb 2019 15:43:01 +0100
In-Reply-To: <20190212142344.13634-3-narmstrong@baylibre.com>
References: <20190212142344.13634-1-narmstrong@baylibre.com>
 <20190212142344.13634-3-narmstrong@baylibre.com>
User-Agent: Evolution 3.30.4 (3.30.4-1.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_064306_953467_425C3E04 
X-CRM114-Status: GOOD (  12.15  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 2019-02-12 at 15:23 +0100, Neil Armstrong wrote:
> This adds the G12A and G12B SoC ids and the S90X2 package ID.
                                                ^   
Small typo here --------------------------------|

> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/soc/amlogic/meson-gx-socinfo.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c
> b/drivers/soc/amlogic/meson-gx-socinfo.c
> index 1ae339f5eadb..c1a9c34d861b 100644
> --- a/drivers/soc/amlogic/meson-gx-socinfo.c
> +++ b/drivers/soc/amlogic/meson-gx-socinfo.c
> @@ -37,6 +37,8 @@ static const struct meson_gx_soc_id {
>  	{ "AXG", 0x25 },
>  	{ "GXLX", 0x26 },
>  	{ "TXHD", 0x27 },
> +	{ "G12A", 0x28 },
> +	{ "G12B", 0x29 },
>  };
>  
>  static const struct meson_gx_package_id {
> @@ -53,11 +55,14 @@ static const struct meson_gx_package_id {
>  	{ "S905W", 0x21, 0xa0, 0xf0 },
>  	{ "S905L", 0x21, 0xc0, 0xf0 },
>  	{ "S905M2", 0x21, 0xe0, 0xf0 },
> +	{ "S805X", 0x21, 0x30, 0xf0 },
> +	{ "S805Y", 0x21, 0xb0, 0xf0 },
>  	{ "S912", 0x22, 0, 0x0 }, /* Only S912 is known for GXM */
>  	{ "962X", 0x24, 0x10, 0xf0 },
>  	{ "962E", 0x24, 0x20, 0xf0 },
>  	{ "A113X", 0x25, 0x37, 0xff },
>  	{ "A113D", 0x25, 0x22, 0xff },
> +	{ "S905X2", 0x28, 0x40, 0xf0 },
>  };
>  
>  static inline unsigned int socinfo_to_major(u32 socinfo)



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
