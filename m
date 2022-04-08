Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4F7C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Apr 2022 07:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MVDUSHyp56qfLKIXmtar7dvOO1IICYafEP/4dwB3gvw=; b=wwbo+BW2AmDTw1
	C8EVVxBeB97RXTuYmX0Pp+T/oYGrlsJBaDepV4w/ZlchfeNC2Q/NesLOLkflaw7+XcGrMUExVHOab
	Rt4Y/MD+7THLhp8vy4Z0zk3nt6JHpKo1khPVjyIGag+ztUqiDIW0mJv7OnjYovRl3iGjRAkZoOCyz
	ghCsmOUgjScXvNSj7GnCb0q+WmakVWAEQ4MqNQ1mvAC9NLu28WZiHC8QB6jCE7HkSOUoszOgl9p38
	2bt4GnAGEdV4epHwkrk3qzSYiqwoK3cN4tUQJ7RM4+idZVBnIqTLyAzGD1G07YwThrkH0v/rOnC9L
	HfsTf/F6Us5+AA9P5W6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncjFY-00FaYk-8j; Fri, 08 Apr 2022 07:41:44 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncjFU-00FaXG-MH
 for linux-amlogic@lists.infradead.org; Fri, 08 Apr 2022 07:41:42 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso7004913wme.5
 for <linux-amlogic@lists.infradead.org>; Fri, 08 Apr 2022 00:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qoPzgwCZVz+2LKUZVk8VaJ97LNpuXNUCKEzLwfvX/Zs=;
 b=vlKCcWfQTZaMrcyeYxoOCOY6TXXsu+qwQrEq7qk51SBgnnEVkDbtgKaVDqNSFdiD8l
 Ftkm7NLTV4iZ/cp7EfmDlDHgPX6rKUDNz7xBd+0hO9j1uhc3lylzLWz89V9lw1xmmXDx
 HxSGY19iCzpy9hq65yDrWd7ycKD6XpFDWuR1lWSjy5VneKRF58+UHQnFpcyzSKfX+hFf
 i0jdA2hb1rhpmOlLh3i4ZI3HzkI8CSFYyRGtBhHb9MJCslKgyXFclXwsKZV5QPBFQbmL
 qJMmiuBe/3Rw089sYDNgpiFr2L9BcXyOSPDRpivX9LKtFO/hZUOot7AL4p8iZzpzemAA
 Jc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qoPzgwCZVz+2LKUZVk8VaJ97LNpuXNUCKEzLwfvX/Zs=;
 b=WFKw7Kb41JqApTTbTKB/Z9JAzp2yvGuuIrUpq9Q736YQsLn5KuQAxmV3/gBTgNuJzw
 ejuFaxuJa9ZCuiZSmljtKV9oTHYgkubZ3C63XFUwOhmflpouFYot0V4j7LRBegspitnL
 mCADXZkfspw3EZCGQBQrym9Ly8mgVAFtYKXppAI7fsL8U2ujd8w5I6ukEE/2GPIDEp2o
 NF6XcQCGO7TnyNWKIAhMEyc0JuLvclQeEHQIxDr5EkVTtwiNV8VTDKqj6ThDNBc7aDBD
 ANXto3VLFIiz8K6OmnppU7BetKO1tdB3lfh0G1eURsLORXFR8bkuTMAbZDRY0/1Lfo17
 kOfg==
X-Gm-Message-State: AOAM530kJfX1OMZvUKjGjJi0PF+d07uB1ipdyU7LB/LypYYJMcSgPpM2
 c7WxVXLh+wRhtao2PPJehB9aYiZLwuR0s1bB
X-Google-Smtp-Source: ABdhPJzRCiav6MWIkNLMa3QPaqs79EK0a2VND7pVXpHUhajmSBRORWzCxAN6YlQhwrfcO/nqZqgn8w==
X-Received: by 2002:a7b:cb46:0:b0:37b:dd79:e1c4 with SMTP id
 v6-20020a7bcb46000000b0037bdd79e1c4mr15472282wmj.39.1649403699091; 
 Fri, 08 Apr 2022 00:41:39 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:eacd:ce6:e294:acd1])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1cf608000000b0038c8fdc93d6sm8890630wmc.28.2022.04.08.00.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 00:41:38 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] ARM: dts: meson: align SPI NOR node name with dtschema
Date: Fri,  8 Apr 2022 09:41:36 +0200
Message-Id: <164940368411.3649905.11710562197285417365.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407142159.293836-1-krzysztof.kozlowski@linaro.org>
References: <20220407142159.293836-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_004140_759074_33B857EF 
X-CRM114-Status: UNSURE (   7.33  )
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

Hi,

On Thu, 7 Apr 2022 16:21:58 +0200, Krzysztof Kozlowski wrote:
> The node names should be generic and SPI NOR dtschema expects "flash".
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.19/dt)

[1/2] ARM: dts: meson: align SPI NOR node name with dtschema
      https://git.kernel.org/amlogic/c/e8662d0832431a069f0138da72c638cb6a377bdd
[2/2] arm64: dts: meson: align SPI NOR node name with dtschema
      (no commit info)

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
