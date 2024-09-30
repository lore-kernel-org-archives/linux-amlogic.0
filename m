Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5567DCE837D
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2024 18:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M0bhI2qY6x4XwKlvaDnL/PQftsHV73Pfc/iAXKZlxog=; b=WrPq2MImS5u6LS
	M5U4GOV1nRuuF0Q8A+EG+fNNJ/25X+3j74dxz1jV50la3GEwBjXVL4UyOnQokETsqDQHfefD0RibS
	zJqgY23fSZ0Lau5YXIl6v64AAcC1QsbfHLYDFCpKG9FeFq/KN3i4Ivbt3HkkDQjiSXFNvtzCLCzXt
	3nrsqCILGZqK8La9IaL7SlpMJVpsOTynGOh7mTlzu5uIXFU00h8AmlrhzvUFvmVRR0ef7gAS6mASY
	97rooz80GZrzqV97rJiabvdH+M1ROPxWRQh95ILDZIT6jlnPw4Fbb9tFGYkD9DP+SF5+5DC3hbuQ/
	fMYuDotVRvB5PGEew5/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svKus-00000000TDc-3QNB;
	Mon, 30 Sep 2024 18:14:38 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svKup-00000000TCa-1KoF
	for linux-amlogic@lists.infradead.org;
	Mon, 30 Sep 2024 18:14:37 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-42cb0f28bfbso36383005e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Sep 2024 11:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727720073; x=1728324873; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BnuPu2GyBAH6sHexBsv2SDLbI/yG/KxkbgJVgNvLoIo=;
        b=HITECOdosdcdmPi3MnxSK/vHMFJdJPAYvx/m/DeJ8h89BvF+4FFtFEjOakSVSm3POo
         UY70i3rMlwd9bedgM5Arpbzxl92zIPQar4dxjE33IAiYQgBsYyYkBovwZwdudcnnWoWF
         JjnQv+tTniGt+wRWWC2UO0UwdDdlR62xYuF/sX9IL4vsm8tJuFP6Gbfk6h2IBVBdHCoB
         jm5wtbMuLvZVwnC8B4vVBhdNzo/BPVh/7zcoyTDblzqc6U2QExBBgeMZzUGKF0f4fxgs
         /nbzab9hPB29vs2osQuEXyyuCHVyAHmQij5Z1vAXXz+91ioUmm6S8xT0AVRfJk8XWwTd
         YXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727720073; x=1728324873;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BnuPu2GyBAH6sHexBsv2SDLbI/yG/KxkbgJVgNvLoIo=;
        b=ale2tB6IuHnAIjHsBq7Pfa8HbkItX8tiWorS3YQbSrx/hTHiWsUYGfBhwA4h4+xMo/
         RmfV8vu03d1LvVY3nvfi1U7GgmM4j75lT0vL/v1rklhog2AJmpb96WVJsFnZa2g0Phex
         3pWQKDgBpnN/+0cWv4p++M2Ptx5xrPIsFgpS1SzKI2FHKA41YRNz7hW0OZdZKRfLOyhp
         9krONRfIivehdokzeGoDUHnq/78J79pIf32RkV8tm1pVAU8ceW+eN7KmldD92buHagET
         N/ZEWDRL3dtE3ezMv1ACmD7hHHRls0ziiMr3PbW7EOMgNKw05z4Wr8a7JH22Qix+ppdl
         Oclg==
X-Forwarded-Encrypted: i=1; AJvYcCUwIZLwzFhr1PXeILKobuPur60GcIq3GeRIFgDHo8uBrQc1WlHP39eln9zGQO8u2nwdXzddLY1pdsVwH+j1@lists.infradead.org
X-Gm-Message-State: AOJu0YwCnd+hCbWXtUrqYWFSRPpFyeReIf6Kl0soCz6vTkvvy72y5v9U
	otY6JprXhVTtg1ye3LBiwq3v2gwevIh8gmv2G69lZ0co8CjE/8WIE38WiMKM9mY=
X-Google-Smtp-Source: AGHT+IFVbFICq/gutzSxAKiw5gYsrp87+XDgg3juU+GA1eGUW05qmSByQBe9AmAMhqxRW7a0aLW0qA==
X-Received: by 2002:a05:600c:4f92:b0:42c:ba1f:5475 with SMTP id 5b1f17b1804b1-42f58484eacmr94026735e9.26.1727720072714;
        Mon, 30 Sep 2024 11:14:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b6ba:bab:ced3:2667])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969ffa22sm157539545e9.25.2024.09.30.11.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 11:14:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] reset: amlogic: Fix small whitespace issue
In-Reply-To: <20240930-reset-align-amlogic-v1-1-f64ed5c4efc1@pengutronix.de>
	(Philipp Zabel's message of "Mon, 30 Sep 2024 18:55:56 +0200")
References: <20240930-reset-align-amlogic-v1-1-f64ed5c4efc1@pengutronix.de>
Date: Mon, 30 Sep 2024 20:14:31 +0200
Message-ID: <1j1q11t3eg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_111435_579637_DB00A103 
X-CRM114-Status: GOOD (  14.94  )
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

On Mon 30 Sep 2024 at 18:55, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Fix a checkpatch --strict issue:
>
>   CHECK: Alignment should match open parenthesis
>   #48: FILE: drivers/reset/amlogic/reset-meson-common.c:48:
>   +static int meson_reset_level(struct reset_controller_dev *rcdev,
>   +			    unsigned long id, bool assert)
>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Thanks Philipp.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  drivers/reset/amlogic/reset-meson-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/reset/amlogic/reset-meson-common.c b/drivers/reset/amlogic/reset-meson-common.c
> index a7b1b250a64dbf94530d06138f4270fff8f56d7a..38a767c06fc71b6dd8a998958b20592499db3c8a 100644
> --- a/drivers/reset/amlogic/reset-meson-common.c
> +++ b/drivers/reset/amlogic/reset-meson-common.c
> @@ -45,7 +45,7 @@ static int meson_reset_reset(struct reset_controller_dev *rcdev,
>  }
>  
>  static int meson_reset_level(struct reset_controller_dev *rcdev,
> -			    unsigned long id, bool assert)
> +			     unsigned long id, bool assert)
>  {
>  	struct meson_reset *data =
>  		container_of(rcdev, struct meson_reset, rcdev);
>
> ---
> base-commit: 5b93105afcdcdb94d654f253850c5432555b283e
> change-id: 20240930-reset-align-amlogic-cd4076c1421e
>
> Best regards,

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
