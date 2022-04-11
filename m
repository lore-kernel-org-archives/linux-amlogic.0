Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825C8C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Apr 2022 07:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z744+hljj9crH+02egdOYZVMAk00kS/EoLnt5xj/4BU=; b=lC0UoenVGZoqQS
	s9QOBEvOyzWtZXUCc5UrFSqDiOyPiH46jYzPxt+zddFN9HZSubjTe+QGQFkNLfIADQKvpNwjwRJRT
	4S/y/FuhixidcdAuWpK3QIDpKmGn4vpg4YDwg/IEoV91dR/CbT+UdzpFjrlYdZJXY8x7dXz8qqZ7B
	7bSBJa3nCuryy/Jii4sYdk3jpQiCghCjvxXWOv/ecnVQysv3WsiG0pl1PZfKIR7LSJr+nHbp7c6Qj
	Uranc+w221yX1GJR/I9R497e4a/L/8kDJHxTftTpmoKFmS4+pJN17jsDw35/3Fb11K5er8e4tYaGa
	HEB69/xIQjgTe1puKYQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndoTT-007EId-1z; Mon, 11 Apr 2022 07:28:35 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndoSh-007Dro-EV
 for linux-amlogic@lists.infradead.org; Mon, 11 Apr 2022 07:27:52 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 o20-20020a05600c511400b0038ebbbb2ad8so1133220wms.0
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Apr 2022 00:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wZSkW98SEIEbhV4Bb3TdcBneRqZQZaCTVUrWB9hDT8Y=;
 b=3Z2fp/lJWPWwBIqHvvH46BbrRC4X+hrEY4HIiAKeFD9N15+Pc3LOXwkx4z0mRgKKQQ
 CgXnBts5V8ZDutpV8FgRN864w9S4ovq/11FilejtVOsXAmKd3Btdspx7GjkuiUnkaEpo
 R454Pw4SnbuZNQJGZC4dK5Hk7dGM+bbWc2wuSSgKQXFaCQeFy3ecS7/9rrQYdK2XC8St
 q/3goMA8YgwrLBY+UnAa7f6FMeiiWGmDsmTBzcqL4uBRk2SyvbUsbxL83FLSNbQnHNbs
 wWyuWMajKX4GDhdvMBafAFkfxzk76BE4txrb4M/yPl9BEcJT4R2GK8Tyf3dKHwadSFHm
 2cRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wZSkW98SEIEbhV4Bb3TdcBneRqZQZaCTVUrWB9hDT8Y=;
 b=QSw9haHHaZlznsc0jHeSnWEHwor1nbEwNNfMw8K0ta8HP3YjCq02a3q1gpQZVNsbSt
 a2UsUdPcz6mQhlEaRiFpCWu/ChtigsqfV68YN7D4VwSzBqCH2BNoKFVYTCrC+1rXUkuC
 Tsizwh0UQJb/CR4GvPMifsUUC2lONec1NQdNxNFjWoFanX3/Y+iXCKiDu7uevnSuZujc
 7hv2zh8OJTAhtsZL/lNA+j872Aooiry3x2DSDEsQkygyEivNCVglpXePrzQE8dXlvoPc
 Ewpw6AUCs20PYzB7/AkteH/53lYVbhcm61ydUg1d1RoX0jzr4D1O+V624gjf0hmzvadV
 CwhQ==
X-Gm-Message-State: AOAM533ayRSPoYSiPVbWdLEprXaE8i+lVn5SXJXkQl4tr4NAQBDY4hNJ
 k9M5cy+DpQtQxsKGWnDpxmJXDg==
X-Google-Smtp-Source: ABdhPJxK439eNBYeBmj50odYBDMozzwt8V7STzblGIDkD8wftNkCQ+v5AbP0Ddx/I7IqteBxuzC+aA==
X-Received: by 2002:a1c:f413:0:b0:37b:d1de:5762 with SMTP id
 z19-20020a1cf413000000b0037bd1de5762mr27942434wma.108.1649662064710; 
 Mon, 11 Apr 2022 00:27:44 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:d1:e096:d183:1bc5?
 ([2001:861:44c0:66c0:d1:e096:d183:1bc5])
 by smtp.gmail.com with ESMTPSA id
 k124-20020a1ca182000000b0038eb706c030sm4031206wme.39.2022.04.11.00.27.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 00:27:44 -0700 (PDT)
Message-ID: <5d5d4590-18fc-1d94-08e3-7ffde8d9146d@baylibre.com>
Date: Mon, 11 Apr 2022 09:27:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] i2c: meson: Use _SHIFT and _MASK for register
 definitions
Content-Language: en-US
To: Lucas Tanure <tanure@linux.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220409164334.157664-1-tanure@linux.com>
 <20220409164334.157664-2-tanure@linux.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220409164334.157664-2-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_002747_808366_11E835D3 
X-CRM114-Status: GOOD (  14.74  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 09/04/2022 18:43, Lucas Tanure wrote:
> Differentiate between masks and shifts
> 
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   drivers/i2c/busses/i2c-meson.c | 41 ++++++++++++++++++----------------
>   1 file changed, 22 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
> index 07eb819072c4..4b4a5b2d77ab 100644
> --- a/drivers/i2c/busses/i2c-meson.c
> +++ b/drivers/i2c/busses/i2c-meson.c
> @@ -30,18 +30,21 @@
>   #define REG_TOK_RDATA1		0x1c
>   
>   /* Control register fields */
> -#define REG_CTRL_START		BIT(0)
> -#define REG_CTRL_ACK_IGNORE	BIT(1)
> -#define REG_CTRL_STATUS		BIT(2)
> -#define REG_CTRL_ERROR		BIT(3)
> -#define REG_CTRL_CLKDIV		GENMASK(21, 12)
> -#define REG_CTRL_CLKDIVEXT	GENMASK(29, 28)
> -
> -#define REG_SLV_ADDR		GENMASK(7, 0)
> -#define REG_SLV_SDA_FILTER	GENMASK(10, 8)
> -#define REG_SLV_SCL_FILTER	GENMASK(13, 11)
> -#define REG_SLV_SCL_LOW		GENMASK(27, 16)
> -#define REG_SLV_SCL_LOW_EN	BIT(28)
> +#define REG_CTRL_START			BIT(0)
> +#define REG_CTRL_ACK_IGNORE		BIT(1)
> +#define REG_CTRL_STATUS			BIT(2)
> +#define REG_CTRL_ERROR			BIT(3)
> +#define REG_CTRL_CLKDIV_SHIFT		12
> +#define REG_CTRL_CLKDIV_MASK		GENMASK(21, REG_CTRL_CLKDIV_SHIFT)
> +#define REG_CTRL_CLKDIVEXT_SHIFT	28
> +#define REG_CTRL_CLKDIVEXT_MASK		GENMASK(29, REG_CTRL_CLKDIVEXT_SHIFT)
> +
> +#define REG_SLV_ADDR_MASK		GENMASK(7, 0)
> +#define REG_SLV_SDA_FILTER_MASK		GENMASK(10, 8)
> +#define REG_SLV_SCL_FILTER_MASK		GENMASK(13, 11)
> +#define REG_SLV_SCL_LOW_SHIFT		16
> +#define REG_SLV_SCL_LOW_MASK		GENMASK(27, REG_SLV_SCL_LOW_SHIFT)
> +#define REG_SLV_SCL_LOW_EN		BIT(28)
>   
>   #define I2C_TIMEOUT_MS		500
>   #define FILTER_DELAY		15
> @@ -149,11 +152,11 @@ static void meson_i2c_set_clk_div(struct meson_i2c *i2c, unsigned int freq)
>   		div = GENMASK(11, 0);
>   	}
>   
> -	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIV,
> -			   FIELD_PREP(REG_CTRL_CLKDIV, div & GENMASK(9, 0)));
> +	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIV_MASK,
> +			   FIELD_PREP(REG_CTRL_CLKDIV_MASK, div & GENMASK(9, 0)));
>   
> -	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIVEXT,
> -			   FIELD_PREP(REG_CTRL_CLKDIVEXT, div >> 10));
> +	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIVEXT_MASK,
> +			   FIELD_PREP(REG_CTRL_CLKDIVEXT_MASK, div >> 10));
>   
>   	/* Disable HIGH/LOW mode */
>   	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_EN, 0);
> @@ -292,8 +295,8 @@ static void meson_i2c_do_start(struct meson_i2c *i2c, struct i2c_msg *msg)
>   		TOKEN_SLAVE_ADDR_WRITE;
>   
>   
> -	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_ADDR,
> -			   FIELD_PREP(REG_SLV_ADDR, msg->addr << 1));
> +	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_ADDR_MASK,
> +			   FIELD_PREP(REG_SLV_ADDR_MASK, msg->addr << 1));
>   
>   	meson_i2c_add_token(i2c, TOKEN_START);
>   	meson_i2c_add_token(i2c, token);
> @@ -467,7 +470,7 @@ static int meson_i2c_probe(struct platform_device *pdev)
>   
>   	/* Disable filtering */
>   	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR,
> -			   REG_SLV_SDA_FILTER | REG_SLV_SCL_FILTER, 0);
> +			   REG_SLV_SDA_FILTER_MASK | REG_SLV_SCL_FILTER_MASK, 0);
>   
>   	meson_i2c_set_clk_div(i2c, timings.bus_freq_hz);
>   

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
