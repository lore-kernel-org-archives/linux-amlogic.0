Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E8AC6FD1C
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Mar 2023 15:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9qmxhba8uja1ubsyV2ee9jnORTutC87RSwDDeHJGtJA=; b=VkHtC8jhHHk3AJ
	aWmjZl41vjeLuwAf6b6RSrA+LsDSMXvX343FcqopOeazgv/lTpIl7R0t03vXsAT4dr5nEGFiNb5Uf
	4JkeePu6LQvKEiFMs2sliBHDZFuYkJ8AX/5cYgauyaKJzzy2tlpb26b5yDh3QGN8+tddz1kITL/d/
	gCzlkjmECOQ7fUeNibC4H5Hyv3AKpUHXO2XsmnIClzm+psYZoq35Ok5q3pG0b91oYeUIjBx0gUhVV
	uSKA/OheZE4TUZwCSWDxakaLlbQuRZeOnoOC9eN999MIUqWO8O4vxGDONoItF/o+txi8oDOaNwFwx
	TIuXvyXRYTfffDMz9zOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc6j6-00AdrU-2k;
	Tue, 14 Mar 2023 15:38:12 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc6j3-00Adkr-1W
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Mar 2023 15:38:10 +0000
Received: by mail-ed1-x52d.google.com with SMTP id eg48so4474372edb.13
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Mar 2023 08:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678808279;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2TF36IhKXXk6YGbpKzPAtC6Xow3FHaqTfrUySLBDzQc=;
        b=yMenpJmh6h0dQFb0waXpMdvJuTFRjxpgNLTbnbIHK6DlBmKA7EEuy+FwT5rSljD1DS
         pLkZtnO4j1rt/C/KhIBdO42UU0o3lw+ksJ8O837YfjkpSmmkiu9lQHb0Rdvkj9TZvkCq
         b55ApjN6XOlMzG11n9kfI2qHIvMM/g7pjEXZXya0+W44ZUBZTHRM0+j+ReL1wHC1Rw59
         TrbFXzrAqmsT/7DTbFASErPZHb2dUy7U8hxFJ9rFtHl1Pv6T4GTxQWVJ0UdupAHCev8q
         YTlhBSEMOITBXK0vnOts68LGZSoNQ5iR27VnKSD7StKMmQJkzF+APxuaR1vydyklinie
         PBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678808279;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2TF36IhKXXk6YGbpKzPAtC6Xow3FHaqTfrUySLBDzQc=;
        b=0RvyEo4zWlcPyU60TFW+I6NEnSdMA/cde1VdpD9hDQ7fyjWyPusqscpZzXYSpImneZ
         JcLxYuOGYBKwG8by70fW3yTYCz5QIY7Lpdw/RIJ7e8qIwyRKZWmcERa8FeV+E8rf4WgA
         kP85F2r09F6g3wMruH4KJ3ooF4tWoRgQX3a1DkIAyPEv+JOrMpLi2mPYwLedn7zCWRzs
         c6MU49XtUmylB4rGtdVMCGRkSbvzItT0JOHZQbKrJ0W3IpLObBiocxbSu6OQoOzHkcog
         Tesz43H0z65rOWAGhes84i96raacxhbYPKv77DKZwN+eGiLIB4NnY0AGOcHXnDHAUM0B
         CwXg==
X-Gm-Message-State: AO0yUKVyXWI60aN7LefEGZey9DiKiOjmpH0OYV4Up3M8uw8Y0ltbujvX
	1uXF+sp8w8ZLidU+o1PSVc7KWw==
X-Google-Smtp-Source: AK7set9VlEaie3T4XSfwYSyfX9w55uBK9zmwb3D2/voALZ/htwROvQHC39CEVKRyTaWJmi8tkw0VJg==
X-Received: by 2002:a17:907:c508:b0:92c:6fbf:28 with SMTP id tq8-20020a170907c50800b0092c6fbf0028mr3153303ejc.64.1678808279056;
        Tue, 14 Mar 2023 08:37:59 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:59be:4b3f:994b:e78c? ([2a02:810d:15c0:828:59be:4b3f:994b:e78c])
        by smtp.gmail.com with ESMTPSA id q19-20020a17090676d300b00922f76decefsm1304341ejn.99.2023.03.14.08.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 08:37:58 -0700 (PDT)
Message-ID: <21add21d-4afe-7840-6c49-3786f82761d9@linaro.org>
Date: Tue, 14 Mar 2023 16:37:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v10 3/5] dt-bindings: clock: meson: add A1 PLL and
 Peripherals clkcs bindings
Content-Language: en-US
To: neil.armstrong@linaro.org, Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: jbrunet@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, jian.hu@amlogic.com,
 kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230313201259.19998-1-ddrokosov@sberdevices.ru>
 <20230313201259.19998-4-ddrokosov@sberdevices.ru>
 <ffebef1d-8447-181b-1890-3e638d399c62@linaro.org>
 <20230314114825.yiv4vcszr6b7m45w@CAB-WSD-L081021>
 <2d9297e9-dab7-9615-3859-79b3b2980d9a@linaro.org>
 <20230314150107.mwcglcu2jv4ixy3r@CAB-WSD-L081021>
 <9d176288-cd7c-7107-e180-761e372a2b6e@linaro.org>
 <c8fecf94-2581-6cc9-955c-324efdc7c70a@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c8fecf94-2581-6cc9-955c-324efdc7c70a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_083809_511158_AB60E02E 
X-CRM114-Status: UNSURE (   9.38  )
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

On 14/03/2023 16:33, neil.armstrong@linaro.org wrote:
>> There are many ways - depend on your driver. For example like this:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/samsung/clk-exynos5420.c#n975
>>
>> The first argument is the clock ID (or ignore).
>>
>> BTW, quite likely the problem is generic to all Meson clock drivers.
> 
> This issue about "public" non-continuous defined was already discussed at https://lore.kernel.org/all/c088e01c-0714-82be-8347-6140daf56640@linaro.org/
> 
> I don't see what's different with this one.

So you are aware that all undocumented clock IDs are still allowed to
use in DTS and they are ABI? Changing them will be an ABI break.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
