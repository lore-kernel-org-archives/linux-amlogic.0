Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD941C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Apr 2022 12:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XzBf8GnnvCcvM11zREL6g2Fl9wMwwutq0fyLcUMWGdI=; b=24aYe8iOd8+54C
	pVEdjan4Pwf2+kiFZwuEy3bAuK5BTJz6AoMdtE83o4quRJ9xqWSaWo2Bb00nnYViVZ1gojzvMjgou
	nGkpDMO8FdemupIhjAIhW29vFQaT5Vm7opF3KQvqQj8Fj2aM7lITDeJJkGs9NE0VrZ/odmxJZ9pUf
	raIJlrCbd2hEL4+SJQZTrI7+qj9Ox5b/Zzrz4s0PS3/hliv6iuU8oAGGxnGojEM94piDZcCZnWzUT
	9aSdAsfTHDRO0j5meiJgUGUj6/6n7GmxjrDkYyZYReHX9xKSjVU1xX/dUe/UMAYiGAwrj6nB4jg3x
	lx8ThDh4MR4X3Tomipsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbM1s-00Ev3j-8q; Mon, 04 Apr 2022 12:41:56 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbM1e-00EuwQ-6s
 for linux-amlogic@lists.infradead.org; Mon, 04 Apr 2022 12:41:43 +0000
Received: by mail-wr1-x435.google.com with SMTP id m30so14339363wrb.1
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Apr 2022 05:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DUL8S2OoMyRqG/7s7R2uoNem727ljU5XkfbK9p9cv8E=;
 b=jfIyJSwm7twCD2gonoFI5cvJ1q989UYupliKqNo5taQD3EC5fk8JIG6tFGn9rPvnIh
 rFW8S0rhW86K58S2y5RliT4UjSAttaoPQuiC+syqjzC0+96Nef5Oypi2MQqj3bojMRYq
 BQluEagVa7jVK0SSg54Oj/TdeWKLapd2l7Q12iUI0mBDrXv0lBfFUAo7B+MU84Zht4xb
 iQH1h23lkNATwU6CGnvxPBtSAS+7bJiGqck493YCSpJg15u0ElPPCQvqGn9bvejMrqcL
 fCTooY9hQRwfyjjq+hzJAB6Wn24VbZIdM3WAJlIEn4XzZJYo66bpFGHSE6gwUlpuXIRp
 ewXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DUL8S2OoMyRqG/7s7R2uoNem727ljU5XkfbK9p9cv8E=;
 b=ghO+jH3Y8UUVFLjp2WQwyHPVPcjdx7Qt48B2SCamO69C5lkHqmrdwRUDPH6r2gsUPz
 GHvc9mHEAeYLRpEodHgbRL4Skbi3Orr8tozevf1u5GmLUFNYyOxRfsKPtsieaJmVTUyU
 IUd7n6MffyAhdz4GrcPWwk0LqCKvVqOG7z3UA9wE6LZsQ17c4E3EBupd1ZhL+pgFAFqG
 EM8VbxnaoGVu5V4rvSkO/w9Kgvgc/QRYkwWzHgDmHnuQm4Lr691KZiqkO7AVZypcGG26
 5XghO0rI1cNlU6ZAwvf/YM7SZ03SmUkXoRFUmFyOr0Sb2oV5cucaHS6GDm2UsjlFB+qJ
 lJiw==
X-Gm-Message-State: AOAM533N3m9THnbAGVeqVsPnLwK81gp4W1G3SRJuMe9j34lSxJt2mP71
 EQx/3nE7mTHQRnVItKGHwuR8IQ==
X-Google-Smtp-Source: ABdhPJxIvCW+TSeCMCYrtX59dAKO6en+LRllfjmQ29fzb7TMQBy6ka32MfCRQwy7hwenEnWYNF6F2g==
X-Received: by 2002:adf:d081:0:b0:203:e209:7def with SMTP id
 y1-20020adfd081000000b00203e2097defmr16839540wrh.388.1649076098346; 
 Mon, 04 Apr 2022 05:41:38 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:1add:1b28:2457:eb46?
 ([2001:861:44c0:66c0:1add:1b28:2457:eb46])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a0560001aca00b00203daf3759asm9772755wry.68.2022.04.04.05.41.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 05:41:37 -0700 (PDT)
Message-ID: <05e7917b-adaf-53d9-c3af-7d65b5f39ac7@baylibre.com>
Date: Mon, 4 Apr 2022 14:41:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] pinctrl: meson: fix unused variable warning
Content-Language: en-US
To: Qianggui Song <qianggui.song@amlogic.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220330023720.18238-1-qianggui.song@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220330023720.18238-1-qianggui.song@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_054142_318332_873F08A7 
X-CRM114-Status: GOOD (  15.44  )
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

On 30/03/2022 04:37, Qianggui Song wrote:
> The kernel test robot reported a warning as below:
>>> drivers/pinctrl/meson/pinctrl-meson-s4.c:178:27: warning: unused variable 'tdm_sclk1_c_pins' [-Wunused-const-variable]
>     static const unsigned int tdm_sclk1_c_pins[]            = { GPIOC_3 };
> 
> Fix it by adding missing description about this pins
> 
> Fixes: 775214d389c2 ("pinctrl: meson: add pinctrl driver support for Meson-S4 Soc")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
> ---
>   drivers/pinctrl/meson/pinctrl-meson-s4.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-s4.c b/drivers/pinctrl/meson/pinctrl-meson-s4.c
> index 3c7358f53302..cea77864b880 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-s4.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-s4.c
> @@ -575,6 +575,7 @@ static struct meson_pmx_group meson_s4_periphs_groups[] = {
>   	GROUP(tdm_d2_c,			4),
>   	GROUP(tdm_d3_c,			4),
>   	GROUP(tdm_fs1_c,		4),
> +	GROUP(tdm_sclk1_c,		4),
>   	GROUP(mclk_1_c,			4),
>   	GROUP(tdm_d4_c,			4),
>   	GROUP(tdm_d5_c,			4),
> @@ -936,7 +937,7 @@ static const char * const iso7816_groups[] = {
>   };
>   
>   static const char * const tdm_groups[] = {
> -	"tdm_d2_c", "tdm_d3_c", "tdm_fs1_c", "tdm_d4_c", "tdm_d5_c",
> +	"tdm_d2_c", "tdm_d3_c", "tdm_fs1_c", "tdm_d4_c", "tdm_d5_c", "tdm_sclk1_c",
>   	"tdm_fs1_d", "tdm_d4_d", "tdm_d3_d", "tdm_d2_d", "tdm_sclk1_d",
>   	"tdm_sclk1_h", "tdm_fs1_h", "tdm_d2_h", "tdm_d3_h", "tdm_d4_h",
>   	"tdm_d1", "tdm_d0", "tdm_fs0", "tdm_sclk0", "tdm_fs2", "tdm_sclk2",

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
