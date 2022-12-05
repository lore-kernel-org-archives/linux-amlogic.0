Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D1EC4332F
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Dec 2022 08:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RID02UoF8fwmok9E/BQcgyP8EG5WjdPrNUjybgjqHy0=; b=lw3QDgKGHbixUvFtpxT1tlPpHQ
	nstFZLe29qOAcWLY/5p2RtU+izWVnDFJCJC8tEZTrWs4xPDeJenaGnrxQbhCAXcrMoQIt0cxuOC4Y
	nUxkldXZrJufsThDH9rGdwVRY/pxDUmhr8U+P2jB4s9nzhbQoQPlkdpOeKMCh0kG1OVa5jQJr5u+M
	ciS7NqiJBP6NgGHr4muEIIynJv+6BniXFiT/V4SX5f0TN33LZ6kY+VUan6LaA8oDX0g02hVdLVJnE
	UuC4KYXryraVbRLbsMa2dHAUSYdtjich1s3KHgrLm+fQl/FFvliKNYMi6PElM47DtLnTOBf20ePAi
	vDX2oMLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p273p-00GRf0-56; Mon, 05 Dec 2022 08:42:49 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p273m-00GRbw-5M
	for linux-amlogic@lists.infradead.org; Mon, 05 Dec 2022 08:42:47 +0000
Received: by mail-wr1-x42a.google.com with SMTP id o5so17481703wrm.1
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Dec 2022 00:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=If5qlixuUuCrpqJqTQzfWNyU5P9n2l4cyuUetIlMVDA=;
        b=mvcWfHXUs+nS4mi6KaQhhybAcY63Fu3k9wkvPSzubDOVRxXnWdQnGlvmDA2gwoUaJM
         PIYM0OVjn2K3cY4mxtML7Prk73+rLaCpRElmP7hINu8qUyIxSnlQKVSxmZZfM58duaM9
         mIqjs1DfmePgdp+lDpG4lNCy7tZ3jKIbapWYdvMdCaQbJ6S2DMEm5fXivffQ13OBjURJ
         MZnZ6kub4xIdQGo0Gskxgp/sgL79BOGNV8eX0sSx31wNuvY7z1aPkELiIT+mv+CKeXb1
         Z7fu+RkUawlZ0iJ8kEP1PrURInk5r4DerdaWnElJwgRAksWUyUUnIG5bMtFjszjTR6p0
         t2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=If5qlixuUuCrpqJqTQzfWNyU5P9n2l4cyuUetIlMVDA=;
        b=wl4WQUM4DhTkAddj44onIS5XHODeGLTbeaZYWdIlW4owKTIL15SCZkPecRrwX3fjfi
         nL+Plnf4sYx2N9/wvPJB7EpM+iybXWDJo6tcjkf1r7DxrcW3tMT+rhdv36TRDbjhHQWg
         4e80Rq0NMPERAyisJvjgIVW/NJWAppTeqS58PFdMPdnFEMRUyZGNwXzq8UNSR7KT8EBH
         3uK6h9UYFv0hYIod0ep9TyEVWYopte7lID9ptzYudgkO1djMGWdsx96Ar+GtzqPlcwlG
         CG/8rDKpApLbYFHKlGa7rx+iXQ0Lziul8guUBwkTkAVOM0Ol8hbnKZCcOOGKgkWxlQXe
         kJww==
X-Gm-Message-State: ANoB5pls/7GUWlHzL5o+F4cRYUU4CJXyKzSV360+HmEVmae6RLq4bQpA
	nW1YxFRW4BQPkk9D90kLVn+TmQ==
X-Google-Smtp-Source: AA0mqf7ftmwbCHcJjnnGuPWrlw7r3FnwQ27WNFbwK36TbXGmqA9uPXrcdiSRAypn+Q9Bh85Th5WD0w==
X-Received: by 2002:adf:cf11:0:b0:242:4f41:2ef6 with SMTP id o17-20020adfcf11000000b002424f412ef6mr5486456wrj.56.1670229761713;
        Mon, 05 Dec 2022 00:42:41 -0800 (PST)
Received: from [192.168.7.93] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id fn9-20020a05600c688900b003cf75213bb9sm20089291wmb.8.2022.12.05.00.42.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 00:42:41 -0800 (PST)
Message-ID: <5f4579fc-36d4-608a-3ef3-8033faed6873@linaro.org>
Date: Mon, 5 Dec 2022 09:42:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 8/8] arm64: dts: Fix NPU power domain references in
 Amlogic G12-based SoCs
Content-Language: en-US
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: italonicola@collabora.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
References: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
 <20221202115223.39051-9-tomeu.vizoso@collabora.com>
Organization: Linaro Developer Services
In-Reply-To: <20221202115223.39051-9-tomeu.vizoso@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_004246_264269_088F3722 
X-CRM114-Status: UNSURE (   9.20  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 02/12/2022 12:52, Tomeu Vizoso wrote:
> The power sequence is different between SoCs in that family, so get the
> right bits for each one.
> 
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 --
>   arch/arm64/boot/dts/amlogic/meson-g12b.dtsi       | 4 ++++
>   arch/arm64/boot/dts/amlogic/meson-sm1.dtsi        | 4 ++++
>   3 files changed, 8 insertions(+), 2 deletions(-)


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


I'll probably squash it in patch 4.

thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
