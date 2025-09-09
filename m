Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AB8CAC589
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Sep 2025 09:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4DYbwKNpIDA1gFnZaQL/Swv5vKHs36IvbprZcyZHoSo=; b=rWo8VpdR8iKMIx
	D8ycUjuLDpc/mTGnLpRz0DFhcv3gMVEw7LYBN4a8xN4WMLhzYnC0IFS1PVbjPd2qsAjZde/Ty/4yP
	rVASvUagtCYADdO6/5WgRbVFwgFzSvfZFcyigConq/FrWzHsLHmFrdkt4+Qa8Xptsqvn3C26Ttraj
	SDFbdcrMapsv3Wo1iYTYR2ZdOTYZXopkF078U+ZUG/nD71pD0pqlFNzZgEoCJY0Q+vyiWnqAdRoBY
	4u4nVqv8V4i4NE55uqB/CtnnZUSGeG1n7GjQMalut0j3hPzc+vhyF550R3q3J68wM2bJz2e+pWVnf
	W7+UG9lUnzNUFSUKqiHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvupn-000000063KC-2dFF;
	Tue, 09 Sep 2025 09:40:19 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsyA-00000005GuD-3hDx
	for linux-amlogic@lists.infradead.org;
	Tue, 09 Sep 2025 07:40:52 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3e1a31c692bso114642f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 09 Sep 2025 00:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757403649; x=1758008449; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uzwBi6UkD6Y6rINc23ZMPuX7niVMsVUOzFLoZ7Re/3w=;
        b=Qa4/VSOGL1zJUDitfRiAASzmctM7FxQW5e3I6F4bnLOO176lPd3jR5gpn/sdElaJ7r
         RvGd/v9NzpygXyzTNmgGHDkmFGG+LZKGr4EQuXqCemP8amweu39rMg+PEJ1jw73AUy1q
         qRFwLUMYFP5kCjmbKkVskozad9nFL0GUhas49fSue+omcdTwgqEzaVZ0FygPwg4xB/qc
         OCEyQ77AulQ8xtEMFGrh0N/2ruoJ/bcUPwiUIXUc282g4OYcgb4ErX6pK5jbiQPVHTRK
         +k9mUBFXQUjgHPE/Y4DVsceq1W1/xe2QbuMdD9PjnmXHGzze53R6t922nBptI5BrK3c/
         TiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757403649; x=1758008449;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uzwBi6UkD6Y6rINc23ZMPuX7niVMsVUOzFLoZ7Re/3w=;
        b=DdchaADqInc7shpAHyeymLzaBYx2vIrAiYqCa3LRKygL32zYpJjkxQXwEECYN1Cw9H
         /LK2l0dAmc/AHpH2v6UeUSB/V6Tz79YJctnoAuMDNlvZPwl99o9u/VNS9uH2AtpM0hIt
         GmKuhb8CHb18tazibj+FxrYxxbam0RkB6tKVFIBdlIn37kyJfvTthzO1J+bR51TqDyPA
         ZGP1/yx6wGJbXU83CaFpTf7izqMPvj83Nzp4463gn1B1oO4TcAPGHDusjDdjkCKIKcmR
         DnjQffuBLTdugQsbYpZlrbowHZTuBn968ym0cgSP9KETZwR3EDRVgzL8GsjhafwWbLqT
         2LXw==
X-Forwarded-Encrypted: i=1; AJvYcCUfoTwx8raHS+9Q74caIaDD7GZXntwFsb5Sh19kLimGqRrXv+u3hD60CqWonEwsZCrWbhayjFopSfrUitQO@lists.infradead.org
X-Gm-Message-State: AOJu0YyIrIzMAPjcjEoPS3tdElbR87jynZwMGlIfpPsQO2Py1364OXWb
	Ctd2DkR6qZj8MOLSNWnAgkVJO1F3Yu7ELt2p8BjVczwGe8eK5kz9XNcu879NSAWC6Ts=
X-Gm-Gg: ASbGnctYViYGuzORf1nPYDqi/KPDihzweu3jE6Rb++FbSzJKCDPhR0OfUMLaILuTzPh
	77ZL6SEY8TtejKMI3BPHM4pQAjCG2/WZ8/qPGNfa5p5Jjn25dj1LVG20sc4poFpb8x9EJrt2TR9
	WlnadXjDZz/FvZS4hwVyWmZQ974jNX/vOVh0ItRTDtbfaLtUc0BgRlbvIpGP9/5o5xnjALK+G00
	vwr60tQfbLGsYZVEQxRmQHi4dXZy48sT4rYJB5uBobNblpjbFbRmfPRcfEX1B/j3HEH1c32lAUP
	+IUyZoasCpaG701+mxQIZ8sPLJSQVxIVykyL8xPbA2Q90jDkgWUcc1SIRYtyO1Z2MQkjy8eKqr6
	SILuC8BVotjIqfBEyP5RQsPTunowobCVg4K2+QlRafyo=
X-Google-Smtp-Source: AGHT+IFJm3HiPoLK/XM90g+fcHzlvHluwqtWos6ed9f3ymuequGjG8kSBPjHauj83Q1H3CcvFKyccA==
X-Received: by 2002:adf:a156:0:b0:3d7:c25d:46eb with SMTP id ffacd0b85a97d-3e643ff9668mr3001574f8f.11.1757403648994;
        Tue, 09 Sep 2025 00:40:48 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521ca22esm1554901f8f.18.2025.09.09.00.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 00:40:48 -0700 (PDT)
Message-ID: <24ff2663-a635-4848-a2a3-7e4d404e31a5@linaro.org>
Date: Tue, 9 Sep 2025 09:40:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: add video clock indices for
 Amlogic S4 SoC
To: chuan.liu@amlogic.com, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20250909-add_video_clk-v4-0-5e0c01d47aa8@amlogic.com>
 <20250909-add_video_clk-v4-1-5e0c01d47aa8@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250909-add_video_clk-v4-1-5e0c01d47aa8@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_004050_945043_ADB30E81 
X-CRM114-Status: UNSURE (   6.86  )
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

On 09/09/2025 09:29, Chuan Liu via B4 Relay wrote:
> From: Chuan Liu <chuan.liu@amlogic.com>
> 
> Add indices for video encoder, demodulator and CVBS clocks.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

What?

You received one tag at v1, you ignored it.
Then you received another at v2, you ignored it.

You added these now... but:
Then third maintainer acked it THIRD DAMN TIME and you ignored it.

Three maintainers had to look at this little patch and yet you still
cannot collect the tags. You waste our time.

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
