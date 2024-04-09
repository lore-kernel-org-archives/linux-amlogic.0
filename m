Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10B6CD128A
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2024 20:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XM0eyx2vWgkZaPoaRTrKTTV9T91Ge+mFB+8GNSJpObk=; b=A/VUkxaxeyBv1N
	07oraH7UMxU+VZ7+0VR5CQ+33z6wD4xDPkdCKP1EZv1L/oMmqZx/6ynjaTZETbXdJKYeLpzxQHSRV
	DcIRuWaR+uPmFtIlJ9kuiiHFVGZUbM0ZUjM7nSNXDmRqbmQVo1wmKRvdSQSw4ScNSCOeJCJthxXuI
	L85UXFzt6uqPzFaSPl/CLe6LVmd2JXde2+fMRzjug/N8i1W/3svNFDu/ssqO3QKPar6Xqr407dh5a
	JLBvtbIf5g6OnfeQqhXvE6bMDGHwqhgHGgD9WAx4qTA0PtLGn/iXf9ziVB7vah9XlZdgpKrzR2H6e
	tTUL+Iue5ayp1XaVI8yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruHoa-00000003f1o-3Muw;
	Tue, 09 Apr 2024 20:11:32 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruHoY-00000003f0l-0M2L
	for linux-amlogic@lists.infradead.org;
	Tue, 09 Apr 2024 20:11:31 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-34641b7c49aso503925f8f.2
        for <linux-amlogic@lists.infradead.org>; Tue, 09 Apr 2024 13:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712693487; x=1713298287; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Mam7gfKzRPyqUPBEMqSn3rNGzPFYkNcQpTBrCPMpD3Y=;
        b=QA+9K1/aXJESkHAbQ1SVP0AHzddoShZT4aH/DLnM2Re3VoSqheOFgH8HwQFXmtkJV+
         Ytfbjc7kWgd5FXP1PYmK840UpBPFpJn/PUbgWeA/uuDucjnVjwHM2YrSHJgD0GMHaWbt
         BmHbOsljCpUgLsEpp+9Tf5aO5Q1HGeS6c/5ExVzHpmzz7G+ROSf2Fj7SNMP7wR7KluK/
         H2LgDh+MYkr1BiO3MVGydt8fabXGBegOZPcJZTuh/0PCTUYgKkwlinq3oyJaBFGQ5bd+
         FuZtF1brow9AdJoS4kX3PazxJiL2QoFuw6waDybd7qSvtmPNrTWxONPvdKFAKpQCZXwv
         GE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712693487; x=1713298287;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mam7gfKzRPyqUPBEMqSn3rNGzPFYkNcQpTBrCPMpD3Y=;
        b=roN3uFZoVRAKgSf/9sc3XfDZ+MbT03P0b7fIpEuz0SoEhHn8MXsKniq8fXoi6FvMT3
         taGSLHPVzXtiv2Pbcf33osX0JbktgZr8/uapR2F+Ob1M3Q7Bf01YqxNKfLXbl9tJOQyN
         uPllIX1cA2MBBULjeww20zE2pZKa7tI4Xwc6CSBlz952un9OvKbXW4sLLVycKkc8a4r1
         Tjb0iTBmPlcYwLBdD/OqoQsPsyipCuy10cB2ZbYpA4J8vfGcmIKo4KbAm/7mX6c4TQ/D
         mGkNhAqn2t66BJ6jSjz8YMJXDkkwaqEaWyba6EKg8goVMEJ1QbwUA1XkaVa/rBGUXmPS
         jEBw==
X-Forwarded-Encrypted: i=1; AJvYcCXjl+0gBIhRpbxA6zRulZti6jLhO34MJkk3UDSmNlI3it9LiP2aVsztpbX5ozxHbB8FAlQeuhcP0YNFESX3W4CNP4lccqL0KN4qc9HY6GMYzNk=
X-Gm-Message-State: AOJu0YyFEIqt2wBnAYHrGMxwplfBabqVqT6OfH6Kw0h1exBAfyRxR5Yr
	JTGpV394ywgl1fWyogEHjFuRsq+ekWw2moykpVcg7xHF7jkXdmKAYOehw3P8K5E=
X-Google-Smtp-Source: AGHT+IHANj6mgSdzXDQNG/W3D353IGikSF74jsqRn2b+oc7tKjPNKQc+cjWPgoGDadOu7oL9sRDOxQ==
X-Received: by 2002:adf:e7c8:0:b0:341:a640:b516 with SMTP id e8-20020adfe7c8000000b00341a640b516mr422799wrn.70.1712693486892;
        Tue, 09 Apr 2024 13:11:26 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id h6-20020a05600c350600b00416645e7e47sm9844596wmq.13.2024.04.09.13.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 13:11:26 -0700 (PDT)
Message-ID: <e216d70a-aaf0-4508-8e53-228a82bb4e2a@linaro.org>
Date: Tue, 9 Apr 2024 22:11:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: panel-simple-dsi: add New Khadas TS050
 panel bindings
To: Jacobe Zang <jacobe.zang@wesion.com>, neil.armstrong@linaro.org,
 narmstrong@baylibre.com, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: quic_jesszhan@quicinc.com, sam@ravnborg.org, nick@khadas.com,
 thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <20240409082641.359627-1-jacobe.zang@wesion.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240409082641.359627-1-jacobe.zang@wesion.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_131130_171926_DEA6C3F2 
X-CRM114-Status: GOOD (  10.76  )
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

On 09/04/2024 10:26, Jacobe Zang wrote:
> This add the bindings for the New Khadas TS050 1080x1920 5" LCD DSI panel
> designed to work with the Khadas VIM3 and VIM3L Single Board Computers.
> 
> Signed-off-by: Jacobe Zang <jacobe.zang@wesion.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> index f9160d7bac3ca..e194309f31b72 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> @@ -36,6 +36,8 @@ properties:
>        - jdi,fhd-r63452
>          # Khadas TS050 5" 1080x1920 LCD panel
>        - khadas,ts050
> +        # Khadas NEW TS050 5" 1080x1920 LCD panel
> +      - khadas,newts050

Keep things ordered.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
