Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A248C001DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Jul 2023 09:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUJkOduAEdIanOAXGVe3dHHzc7E3vL/ocyfjyhBO0GQ=; b=IRguJksvdT+ZI/Wp4aG+Wtvhic
	7karjcnpPrFL9mBLFOKZ2L4PObfgbJk98qpRqTuBTADfFdgRkUf7OFTdj7pSHA/u20BtzXlYgVhLU
	1RGmkxKzYKVsprAyQJ0V48aVKSLdE1xpaje1+7rI4aNu+i4IAKdkqjotx//IyqWsCmXMOUglDB57z
	5JPwuCgrw+ccl8+QLg0YaKipERq4WTlMXwtf4QmjLnin0Ro4s2LhMIRCD9Z1wZ8tpaqp4VHiyniQm
	vGuMwaWevNArYTeMLYXSH8ZP0gyO2c286Rgj+eU9PKhsNAz2fd0oELn8HK5P3xR7EXM1gd/bVZlW1
	EXkvttRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQP1q-00EkUr-0D;
	Mon, 31 Jul 2023 09:17:26 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQP1n-00EkSa-07
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Jul 2023 09:17:24 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-316feb137a7so4526769f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Jul 2023 02:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690795040; x=1691399840;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2uk953bwdNMqiO0gx9LYl/Ku1cESFMXCc6kgn3JBlzs=;
        b=RitRb5x6yrY3zDVwThstz0r1jBGbUKjoq96xlvK2GCxyjXNkWC0zoLPqiTPdYiS6Ql
         kHT2Mrx5JoxNvAw7R4jScAqIQQipr5xup2zJo509BmVZ788PbGsGmdSgx1Sh6J1R3H6Y
         aJ/+m0ThBiG5CqzZ+8m8ilv8s8y4K09Uoa+6B3OT2QG8InOiS16au5A34m8fl8+sE5cd
         r75urDO8NgoYVUWgKWZmIqecwxywqohImNjhm2Q93Iq+Ja/wqhaUu/ZSnRGwoFKaihN+
         Myr9GW92aljS9Wr6dbmB3Fgu47rx7CTx77dF+9L6/sNDV5SEbucw5njS1kDZVZ5Fln9h
         Aqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690795040; x=1691399840;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2uk953bwdNMqiO0gx9LYl/Ku1cESFMXCc6kgn3JBlzs=;
        b=RmXXQ4aadNcTVhX7D+Ue+lAiCbKnqCDCdasJ8f1VYOK76dm20ro9EKR6thlxDByvdm
         WnvodWERcf3gcOI4RE62g/zRrmwxO4HB+MegXOD/d4n+NJQBbJ92gQrGUSmuGEaZYU4K
         tgs5lf/sWkOqYwN/j+IDaOuGR2FxnTG+lqyqQaNUeJoN7kJKQ3S85EbsX9zRQ3WWfFwc
         c4NKp/veNTvLEvhO7wtAfbxn80afaRcrEqG43rENao/j3JX5fKME4dNaRKPXTPxw/c+G
         nrzj9aTtxU3qCena2kd57yH2a4gZnO+l5BPzUbM62rUspNYxH79K8groHNWFy/l1Z5YW
         q37Q==
X-Gm-Message-State: ABy/qLbLS+KYuXu/2gwh2HRfWFFKmuXKh4+iH2KLR4g6kptV09iQ91Ih
	BN9I69IR0jUZ4mPQ/N398ptXqQ==
X-Google-Smtp-Source: APBJJlEDuxdvkuBlHEz6xcvCQ5+HTQ85ImfVu6HCehgYysTS6a2nnl6hBozXYDb3bPdGWagF6HSMJw==
X-Received: by 2002:a5d:4687:0:b0:315:a32d:311f with SMTP id u7-20020a5d4687000000b00315a32d311fmr9453837wrq.14.1690795040271;
        Mon, 31 Jul 2023 02:17:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:14b8:9aa7:6bf0:256d? ([2a01:e0a:982:cbb0:14b8:9aa7:6bf0:256d])
        by smtp.gmail.com with ESMTPSA id c4-20020a056000104400b003143b14848dsm12419609wrx.102.2023.07.31.02.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 02:17:19 -0700 (PDT)
Message-ID: <f121b407-d6da-73ab-4cc6-a7608cf069a7@linaro.org>
Date: Mon, 31 Jul 2023 11:17:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: meson-sm1-odroid: drop redundant
 status=okay
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230731090442.100856-1-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230731090442.100856-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_021723_076678_95E9E314 
X-CRM114-Status: GOOD (  13.18  )
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

On 31/07/2023 11:04, Krzysztof Kozlowski wrote:
> status=okay is by default.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> index 2fce44939f45..cdb80e0a7718 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> @@ -181,7 +181,6 @@ sound {
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> -		status = "okay";
>   
>   		dai-link-0 {
>   			sound-dai = <&frddr_a>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
