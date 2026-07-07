Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C8FC43458
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2026 20:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VnKlVMuouHfKEXtKt07WEfd4t1jXaEdnKQnrGUEyhTg=; b=b+Fiw48MZQeyXQ
	c4up54QrXgvlclus3/DzACFrPgTYRY6bNpb/gMLXapcyC8/VJygafM2JK0wdMaGgwnfptK5gPtN0o
	N7UN+FjX5xLaMg+GIHXMF5lQtR6gg9PYYBwN6Ie632566NitPjQyMKG0ZoTCcsJTVg3KofwCKnyYm
	BbJYvpoaFggxRP3fZaOX4u1v6S1JXFp1k1xrjY1avr8gXlVH3gMq++UDJKNcS8qoUHZHAgIEJbsdj
	UZJjnMPu9XxtfQgY+FiBTbkHy+faBNWf/0ZEj9mvCIZg/kCGJdTLxRuDe6AfNNxlCpviFTzouES6J
	oeCmuJllOB1cb53e55eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whCUZ-0000000FrwE-0Bbs;
	Tue, 07 Jul 2026 20:34:07 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whCUV-0000000Fruu-0HZU
	for linux-amlogic@lists.infradead.org;
	Tue, 07 Jul 2026 20:34:05 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4758bd3731bso878105f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Jul 2026 13:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783456440; x=1784061240; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O11o5MEN33Vh1fP73gT+0ZVa3EZdhEdLDt6jcZLOEk0=;
        b=RRhkwUCEjFrRw58/vnWJV7zrYOsuSHj8QG/6hT8GAHFb83DVXkqugFukgryt0jDure
         s7xdxpBnwDsGNUtDcYeCp/69ttkUBT/UNPhGqYSDAOZb+hfapYZdtZK1LbaOGDqy0SbU
         7xTQ9eVFx7MsxW/yOwrNEWo/YnPEx/qUGmaVOVL7FzuCyLy/mHedOG9VM/7Xnnt+rRPq
         /T2Zuw0qtBktsqHY7zg1rTFOIMqd6Ln4kmI4QnCYYHkJcZq3U8qyGk5r7WSpItMyNyJ3
         DJnTpU7GFUvRIbKtVxSyJGtqLLlrmPmc9GnsA2cOoUaKe6qusTUHmpK4QF76h0pTRPMw
         GGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783456440; x=1784061240;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O11o5MEN33Vh1fP73gT+0ZVa3EZdhEdLDt6jcZLOEk0=;
        b=QtFVwJLlSlKfd63Xw+sepnVJg9ETVQe7avyDiyxatJAx7AYcWd2kuKuNCN3u5IACDY
         qq5jh8fFzqQYaw0TmjVv4ALYmm+8etaLAyluo7lW5iHEWqR4nljjQ/N9DUOwW/Wx/Zwo
         EAs43eNsFbJWcjV3KMDsvXGJ+UNskeAACdf5+XPcCE6hW1eqs5tZprGxKXbAaJYfYOcS
         ADl1Rl+jrrIVhPjDqjHwxmZHMQOlO4ZDfhBaniGiT3nefhSApKMncCyYYt4E2WKALLY7
         kps2epwYRcKeMUlWEcp5nwhW4dgYIYxOmKNWedqF0Ii0smYbXePZj3QVATmkrbUF1JYi
         p89Q==
X-Forwarded-Encrypted: i=1; AHgh+RpaI6SYfX8WZbE3MKpNcj59/1OiXd8cJwU0wsdOh6KbHPwD+thFh4UmXdwD1T3f07dPeF1hhy7mT+W+ERI9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6tfu8g1LArkYQ9knxg3XJpTYxEjFjMRXK7UnMm93Ej/deliG/
	7a+3auIwigucBLrz7LQXs8ZllejSbm2BBIVO99VfNyTi/+xsGSaX38UaEdccNTSmiWc=
X-Gm-Gg: AfdE7cmm7OJxzMDpq0dhArbDIw/gWiz5rf4EZDb1JHBoik3CTF+wcdfPyuazpn4zCSW
	l8evGvxYHE/dfirJtP1kbrrFwPySVbh9PC8ewEgNEBGG4U/qyONpA1zPa5fTi3CHrqhqSYod0lk
	WGEE4juqM116tp7tYjclsQFSK/jBBl7YJiqhVYJmKMoQFVSr5AORz9RN5gdR+Yl1eRzVWRv0d/b
	dkn0u6OgqUr6XdbByRASB93VAskKwwyLzfcM3iRH7cSeTbJWZeZxoDtwSzTutGFQQw6Dw5poPTY
	qrHhQr6YV/KImkKjdMaYFZmjOc7e1M3NbBa8DPbTchUTrU+7IH1F5UJ+1cWU1Fk2UYHhIb0jErg
	71nH945rBdquvKKWeqU9vlbhqMjlEkjAtmXD5pHXtYl3yyDZGl4ivJXUa3SbsUEf1Oax9C87K15
	b3rEHi0Ze+a7L363U=
X-Received: by 2002:a05:6000:2891:b0:475:f0c2:75b2 with SMTP id ffacd0b85a97d-47de9a41059mr5106546f8f.29.1783456439812;
        Tue, 07 Jul 2026 13:33:59 -0700 (PDT)
Received: from [192.168.3.100] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8f1sm36801444f8f.3.2026.07.07.13.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 13:33:59 -0700 (PDT)
Message-ID: <b955120b-2c32-4b03-9e7f-f236692cfc7b@baylibre.com>
Date: Tue, 7 Jul 2026 22:33:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: meson: aiu: Fix resource leak
To: Ethan Tidmore <ethantidmore06@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260707012424.1661733-1-ethantidmore06@gmail.com>
Content-Language: en-US
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <20260707012424.1661733-1-ethantidmore06@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_133403_167254_60D4F6A3 
X-CRM114-Status: GOOD (  22.44  )
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



On 7/7/26 3:24 AM, Ethan Tidmore wrote:
> In snd_soc_register_component() error path, the aiu-formatter is not
> being freed. Instead of returning now goto the err tag so the
> aiu-formatter can properly be freed.
> 
> Fixes: 83b83024cdbfd ("ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data")
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
> ---
>   sound/soc/meson/aiu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
> index 64ace4d25d92..d6b644a53f7e 100644
> --- a/sound/soc/meson/aiu.c
> +++ b/sound/soc/meson/aiu.c
> @@ -310,7 +310,7 @@ static int aiu_probe(struct platform_device *pdev)
>   					 ARRAY_SIZE(aiu_cpu_dai_drv));
>   	if (ret) {
>   		dev_err(dev, "Failed to register cpu component\n");
> -		return ret;
> +		goto err;
>   	}
>   
>   	/* Register the hdmi codec control component */

Technically the fix is OK, but I don't think the commit title and 
message are correct. aiu-formatter data is allocated in 
'gx_formatter_create' using 'devm_kzalloc' so, unless I'm missing 
something, the data should be automatically freed when the device is 
removed in case of error.
What 'gx_formatter_free' does is simply clearing widget's private 
pointer (i.e. 'w->priv'). I think that not clearing it should not have 
any bad consequence since the pointer would be overwritten on the next 
probe. However I agree that for consistency reasons it's a good thing to 
clear to do when 'aiu_probe' fails.

So perhaps the title should be rewritten to something like "ASoC: meson: 
aiu: reset widget private data on probe error path"?

-- 
Valerio


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
