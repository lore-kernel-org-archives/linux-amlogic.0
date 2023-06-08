Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAF7C7EE23
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Jun 2023 12:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rGyqncKzKlIEfRM+Jb4m2iu8XYw61x6CxQsPv5w+t58=; b=zq/ZwpOX4STbg8
	g9CjhMM7ftPJ79p1HXHrEMpIv0b86rcCYPbGYZM9qjqKJcemXwdbGPzNnGM6Mnw0JOAW9Gyp+x6wu
	XMgMQ6qMU2P/RMGZrk1PoMqcMv32e/u82thz/6b9axGuTSy0UuE2tmOMKSH2qMbxu7ScF/vOotSMT
	uIi5VA/2TWVlHuHfGUmBU94DLb4pBhvUKpGGwbfW0eAzYi/DQa+rpdOw3+DwLwgG93TVs9WP+Mdlw
	ffh+S9qSqVRVEUJiywkFrWDXz2W2Pw04zgln2VlbbuH3PTJv5nHZVPwNARo9DwXsOB3mfojw8oNna
	b5YrR5+WdHHIv2aalbPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7F2N-009NSj-2Z;
	Thu, 08 Jun 2023 12:46:47 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7F2J-009NRS-1j
	for linux-amlogic@lists.infradead.org;
	Thu, 08 Jun 2023 12:46:45 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f6e4554453so3587115e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Jun 2023 05:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686228399; x=1688820399;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=CMFHwMliziKYarDXsCrUtrbOwmn9xCAiYAb+3zNmljo=;
        b=hKJREq3JfLY/XsiQipzbIVCN0ANM2uldq8v1iswOfxOQ1UOLdudpFOoIBEqPbzDw/7
         3kB6B26Pyeq06ScIC7tYlmxaoZgp7yKpI/PhZ7OkjdIyZHFK/Rt3P7lwzH6ai3LIyjE4
         /OyLMfxI4ChC54k7vZRCfhiAh+5AsASPT2VYBxbzYWycgyGsvi5w6zYMxaN7Nxtnaj+M
         73BNJXbKYDFzoAAa7rERJinbBJcV08YGYQQ/ATjpGfVFguMprhGS5fYNT49n/4IU/rhw
         vbhAaMr4MsQgaiEZPZ5sB8av1WOF3jyqsele+sagaiZ+vdWvj+AvxeeniI1r4Q2ya0ZY
         Ee2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686228399; x=1688820399;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMFHwMliziKYarDXsCrUtrbOwmn9xCAiYAb+3zNmljo=;
        b=YpY7RywMrsDmbWMwdnhNXGDwPs2VhA9FVktfYYqiMOKYpvwmJOSiWxsTSyjzi7MG/j
         2PoGDRw0CYmyDwyuUvg9isKa7GgCUw11AmeEffitP9qtU7NtAaq8nMVlct6kCeXXhEca
         shBVH3p2CgbbevKpCg83p6WL0pdKdRkhP0mLw41PPSSBPEpjW1mm6h7kNH2PESR8WYnz
         OCkzIjjNh6aRBgNXqh72LjZpy7ZNVQWgaEBjWZzZiwOzZ8R/OCZOx9oMcDSljfPkybHc
         2wbYw4ncD9TFUNBgp7EXlwggoFbhjFBkd+Od+U+/OC5cyzF/2AaOWExK9zqAShHTnuzF
         PtMg==
X-Gm-Message-State: AC+VfDzkiejR/8c8VxpweyoaiLdUxX7jhe54jz4dnfvm95TaqrGQx1rg
	XDdydCadgCAhODYsoi3myacA9A==
X-Google-Smtp-Source: ACHHUZ6AxtMgFWx0rJFjvyzpW9XHh6kXg9e96BPd9QX3Ps59AQ49MJSZFz7Us9+NWRGidb5mpAB3Gg==
X-Received: by 2002:a1c:750a:0:b0:3f7:35a9:dfde with SMTP id o10-20020a1c750a000000b003f735a9dfdemr1352995wmc.30.1686228399673;
        Thu, 08 Jun 2023 05:46:39 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o7-20020adfeac7000000b002fed865c55esm1521722wrn.56.2023.06.08.05.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 05:46:39 -0700 (PDT)
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
 <20230607-topic-amlogic-upstream-clkid-public-migration-v1-3-9676afa6b22c@linaro.org>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 03/18] clk: meson: migrate a1 clock drivers out of
 hw_onecell_data to drop NR_CLKS
Date: Thu, 08 Jun 2023 14:45:29 +0200
In-reply-to: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-3-9676afa6b22c@linaro.org>
Message-ID: <1jlegu9l5d.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_054643_809438_306F3C59 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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

>  
> +struct meson_a1_pll_clks {
> +	struct clk_hw **hw_clks;
> +	unsigned int hw_clk_num;
> +};
> +
> +static struct meson_a1_pll_clks a1_pll_clks = {
> +	.hw_clks = a1_pll_hw_clks,
> +	.hw_clk_num = ARRAY_SIZE(a1_pll_hw_clks),
> +};
> +
> +static struct clk_hw *meson_a1_pll_hw_get(struct of_phandle_args *clkspec, void *clk_data)
> +{
> +	const struct meson_a1_pll_clks *data = clk_data;
> +	unsigned int idx = clkspec->args[0];
> +
> +	if (idx >= data->hw_clk_num) {
> +		pr_err("%s: invalid index %u\n", __func__, idx);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	return data->hw_clks[idx];
> +}

I'd prefer to have a single struct type and and single custom
callback for the different SoC please.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
