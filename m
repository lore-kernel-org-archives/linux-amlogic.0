Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C4BCF64A1
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2024 10:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m4+rsX64mTZsSSF6daSiq8Svy4YK6BB/EpmxSckapwI=; b=eaj+4ZFHl8axfF
	DfZfT3fLPKfg1dd8uh3bDbkoMyUFTket0qZ0rDRiTFPwAShB3kcbAFVEYiM5vIInS7ACc7Urrpa+Q
	0XMC9d3myyGzso35OdX2Zu7Cvi/ZxtReNAZ8h4cLBnAM00qcXthnlSaULC4q7+LE3DVOGvzGBHheD
	9SMSwri+FnOjz0jk7OJCIle2CHFCfaVbpeqLOIWPhPRHh7/fhiwUJehj3uCRnGsosR+KAhm/+cbZi
	W+fFms21grgBcfoSEoSy+MQlfhBujCVuIWllwgquwa++v6/1fUAL1L0e3jkT/5+Eu2AF9RJb5nLTc
	xEzkrT6m2pmsfVACC5Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svDFw-0000000Gck3-27Zw;
	Mon, 30 Sep 2024 10:03:52 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svCkm-0000000GXKC-1HMI
	for linux-amlogic@lists.infradead.org;
	Mon, 30 Sep 2024 09:31:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-42e748f78d6so33270105e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Sep 2024 02:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727688698; x=1728293498; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LwF53HfMvlXuhOmi8Jap57yZA7y1v6ek9XyMVgwuNQY=;
        b=RTpFA2zl4Enl49/yndRW44LxqWTJJQYvd9ZsWEcnFJYVplsK+Zm8IYf9fNod74nPuf
         dWTYgx4RU9X9ymb+6FEbBpo8MwvHStWkvuf+9WwDnmEIM/+fAjZmmy/x0234OldWAbN6
         /9nkOVGen06ujYlmeKcYn3es3bBNBYWAZXd7Ck9iyFXdFNxLpF9RP1S/VwDJKureVO5l
         iH7gbIirkuiyMBAjqzYi7rwJ5MT/lWZZzEN9pDe/5/vkPAXEKrSL1PrJgjiEHyuaEWhG
         J/Pl7813K3YLMiVpzeSoDLLAT8m2RSmMSWuOJ9ObZMFpiuqkRIiQQOCb2zNuiJBqB7hG
         WCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727688698; x=1728293498;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LwF53HfMvlXuhOmi8Jap57yZA7y1v6ek9XyMVgwuNQY=;
        b=ooPnCUi2MxPX2fbsiuC/YTurGUckcsOtqohKjUAG44nQMwb2yQnSFOvXAXl38wxIup
         1u+gtzpdEzluJb1HQ5XzpqX+sytw5AP91z/p/FpO5WdKWaViI1DWwYWkQSZ4Wx8yE7Hc
         vswzjwyp6OoD4t9jISDNAytWHnk7R6xZWJqI2FGpyL6TamIe73y5lYWLvaHkRABYlZg2
         FeNbnDeQNCdwXEMqESmoWQaF4uf2ze2fxehEo0Ui1VqWZ21BJbAjEBoWmw0L2rccs7v6
         IqWQaCF9v9wJ9pGsVkpDDEGjkczIVlUhy1ZQLHpKT5Cs8uRGaoV0l43GhVur33To860A
         1KSA==
X-Gm-Message-State: AOJu0YymzaOFo5ChilVIc+I3Xtrc3zL62CQucDCSPtiTvF4BjmNMsiec
	AX2TwKKEMjkGczdODZerYoX2Rpn5eoJj7W5KXO6789GLY2sK9HqZ9xFjLGNcMTE=
X-Google-Smtp-Source: AGHT+IHzoe6B9tw2TkIPiu3wQYEMqRU3r49tMqeybrJ5X9qmi6lref0ezf3DDmzQDmXsOhKwsOO//g==
X-Received: by 2002:a05:600c:1e17:b0:42b:a88f:f872 with SMTP id 5b1f17b1804b1-42f584993aamr81370595e9.32.1727688698185;
        Mon, 30 Sep 2024 02:31:38 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b6ba:bab:ced3:2667])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42e96a521f3sm145603465e9.40.2024.09.30.02.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 02:31:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson8-clkc-v1-1-e0b8623c090d@linaro.org>
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson8-clkc-v1-1-e0b8623c090d@linaro.org>
Subject: Re: [PATCH] dt-bindings: clock: convert amlogic,meson8b-clkc.txt
 to dtschema
Message-Id: <172768869708.21792.17420534128069202977.b4-ty@baylibre.com>
Date: Mon, 30 Sep 2024 11:31:37 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_023140_477603_4AE8C10F 
X-CRM114-Status: UNSURE (   4.22  )
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

Applied to clk-meson (clk-meson-next), thanks!

[1/1] dt-bindings: clock: convert amlogic,meson8b-clkc.txt to dtschema
      https://github.com/BayLibre/clk-meson/commit/6bac1ffa9ca4

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
