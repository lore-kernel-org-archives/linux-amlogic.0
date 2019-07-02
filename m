Return-Path: <SRS0=LWkI=U7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D1DC06510
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jul 2019 09:52:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B80420665
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jul 2019 09:52:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bDg2ztnR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qBSK4mPH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B80420665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9MNVcaUTsoPJ7kq8EDCPfNzFhwwSCp8PmW0a4Xp7rbQ=; b=bDg2ztnRPCL1ze
	rq4Hk5TXLVrRKXgqSCrYxCMXuuCBQI9oQbrU+i+XQSjQQlA35bu27pfWILOPddyMMlNFJv3LGUR1J
	eni8S6CZ9e9Zzzm/BQC3DYHPHf9U6BO6msFiZ/rHLNcW7/zxLvcqMSrtZp6GxxRYVddQlPNElCeK3
	cMjuHAuLhZ4hvRD11vVIropj0RpI6BgCY1COqxz29CrSzh8Rg6O8IlN737BW3fZV5BDW/7pZECzHG
	OK1tH9tI1Me4ZRitNqOsDs37CPdyTUvD32ThgxEgM2cPc7P3Z8axTKwYZz7wv7UiSCjWbglds4fo7
	D4IxX6AVNN8n8MTpyevQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiFSS-0005f2-0g; Tue, 02 Jul 2019 09:52:16 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiFS8-0005PK-HS
 for linux-amlogic@lists.infradead.org; Tue, 02 Jul 2019 09:51:59 +0000
Received: by mail-wr1-x441.google.com with SMTP id p11so17030115wre.7
 for <linux-amlogic@lists.infradead.org>; Tue, 02 Jul 2019 02:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=q5AKb2Aq5cM23CpGFfqHRfDVm9/c55zJeMrlP2X57BQ=;
 b=qBSK4mPHwueHeFFFdMnsPrDgtnMK2xQQNILFIFKDGb5AgaTdKhFX0gEYTMeiS1C9e0
 KrPknp/kJO8pWTVTXeT+vODB4Z3ijy42pYYLFy0JwLBpizW5Z1K8vAIY6af5qUwYEQBr
 Drf/kb7mGBV+f3zKuaIEgtseCKCaaMKiI9+w6Of6tFcq1OuwoXGemJgNokc+1CBdxmuH
 4+2PMSH3e24bwhavxxTXHYHMvBMNHY0ZjQI44RRK9H+WuZ7IARVgxcs7uV3lqeiPLOOJ
 SsC37UqfBaqtk2IvxtMf2sSBPqGQXWSrFOkbBphM1aPpAI3Cn9nEiqAj87531tMI4VST
 bGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=q5AKb2Aq5cM23CpGFfqHRfDVm9/c55zJeMrlP2X57BQ=;
 b=gZaqlQhcvQjSYp3et288UMxIECP8n4PerMgFh45hGxbOiAfaveyp9QzMQFpPu9AoOG
 V6sFVSWIT4HJwvky3g92cc/x7KI+osyUZN7smbTryyxR0r7ndPoaLz+jvWL9dU6g9vLS
 /Kp0HkXueNa/QWCIGlkxxdHtnxf9Wkg1+DcKZ0GRf0w9eTyGva9VZWfEPn4Mcsz4bhU/
 45rUMG9qAC8vJCBcFTPLT4dGL6OusCjKOovo40Ka8P/g64ko7g9e6Vw1oX7u2ShYwpVr
 yJd1Fpam5bqcV2Y1mRoa1qVQKMqViQn4c3YcXOk/HVudclKaIDucc2LiZf68yVcnEins
 ZBIg==
X-Gm-Message-State: APjAAAUMHOiBnLV8Fmz9ibo1u5Wr6P/fS0YaRvm/CuIeueoks9gCV24g
 QahONlWi89cukxlkzaOMWHeHqQ==
X-Google-Smtp-Source: APXvYqzI8kW9XU8FUJQ7IGAFwA6pRPzGymWZ5cX2bvdpELwcRzBOCEXK8fgrUKd0pUhUkjJf8qWPdQ==
X-Received: by 2002:adf:8028:: with SMTP id 37mr22701037wrk.106.1562061114977; 
 Tue, 02 Jul 2019 02:51:54 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 32sm27240587wra.35.2019.07.02.02.51.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 02:51:54 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com
Subject: Re: [RFC 01/11] soc: amlogic: meson-gx-socinfo: Add SM1 and S905X3 IDs
In-Reply-To: <20190701104705.18271-2-narmstrong@baylibre.com>
References: <20190701104705.18271-1-narmstrong@baylibre.com>
 <20190701104705.18271-2-narmstrong@baylibre.com>
Date: Tue, 02 Jul 2019 11:51:53 +0200
Message-ID: <1jwoh03gsm.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_025156_630011_040AC653 
X-CRM114-Status: UNSURE (   8.55  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon 01 Jul 2019 at 12:46, Neil Armstrong <narmstrong@baylibre.com> wrote:

> Add the SoC IDs for the S905X3 Amlogic SM1 SoC.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  drivers/soc/amlogic/meson-gx-socinfo.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
> index bca34954518e..eb81d391b620 100644
> --- a/drivers/soc/amlogic/meson-gx-socinfo.c
> +++ b/drivers/soc/amlogic/meson-gx-socinfo.c
> @@ -39,6 +39,7 @@ static const struct meson_gx_soc_id {
>  	{ "TXHD", 0x27 },
>  	{ "G12A", 0x28 },
>  	{ "G12B", 0x29 },
> +	{ "SM1", 0x2b },
>  };
>  
>  static const struct meson_gx_package_id {
> @@ -65,6 +66,7 @@ static const struct meson_gx_package_id {
>  	{ "S905D2", 0x28, 0x10, 0xf0 },
>  	{ "S905X2", 0x28, 0x40, 0xf0 },
>  	{ "S922X", 0x29, 0x40, 0xf0 },
> +	{ "S905X3", 0x2b, 0x50, 0xf0 },
>  };
>  
>  static inline unsigned int socinfo_to_major(u32 socinfo)
> -- 
> 2.21.0

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
