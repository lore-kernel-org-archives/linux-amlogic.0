Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A29CC25B10
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2024 11:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EKFfQO0xtRtCg5dNAdVvzArO6FvQ2IBeY6AQBnJmIcA=; b=br5oAUwYOX0Yq4
	LYR/3KNmY8tJiZgb/WoiZS9gKfqRFoER4pUggc0+AcuqU3Rl4VMPjGDULsERvG998pY3MKgwg6JIV
	avsj1suWOcughgHaJ00L0gxfVGi0N39674zVPd8SaTHO32dLmcVpiIXPsye/F7xB+al0bEzEd7YIo
	PtwgUrWrxUxuFdVijYuLz6DfQTt/kAb8h/WfbN28neup9jeRfQfETJj1nXYVFjd8ZqcrbbfuOIHEr
	EuspuG4OMJjL8/HtPVv0XIB0mAhAGJ1lV/R80bhmW7PU6hCk+KK2zHjGv2EIWuAI9QEkW03JBgJy7
	oV+6WipJCaE+42KSPHpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1PVG-00000002W4C-2ocq;
	Mon, 29 Apr 2024 11:49:02 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1PVD-00000002W3N-371d
	for linux-amlogic@lists.infradead.org;
	Mon, 29 Apr 2024 11:49:01 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-571c2055cb1so1014585a12.1
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Apr 2024 04:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714391337; x=1714996137; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zgF7uDK3ODdULvp2AprCnsXD0Ii385XkEkpICxLIUP8=;
        b=DmojqDCTwpsKQ7hDOqN9p50p0d2oVRzpDmZmrsHaSNrsoGPunx7Y5/g00ZY4qiHL13
         Mcd3lvzAiDJI65KcSv7o6XapCX22nq6VWFSqWILruyL8GPjomfjdtjhcNJFbo5I9XRcp
         Comt296th8d+z9eyqwxg8QGJHAz8H0G/UNDaAxZZ4JfN71OcY7q6iqFUNcdq0QHMpc8y
         tMbpkMUNfgz67hiRKITI46zZPAXmHANNvMPhcD431kyxuDNBCTaBii3Jh0M3+LbnpZ7A
         /lIL8LKDHhvbyX0pqRJkHGjFT/un7tYN55dSWr2t/YELeWUcxbyKbUWh++a18wstN0a8
         qNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714391337; x=1714996137;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgF7uDK3ODdULvp2AprCnsXD0Ii385XkEkpICxLIUP8=;
        b=YysWyFfOEwlg8GKokFeoWTTFNfUB1g7H6L0ei9vIlFJC84Abybe11JSjODko9ljs39
         PDO6h29iPHOHdFVksTHuduCPh9n9daOwkYrIs6ZUAhvME9rXDKbnIzqOaaUMfe7pGT9P
         bgl6lhEuHuo66XnSOkPqz9SfcG2k8/3EUnAvo/c6SwTiB4FA9ZAKu2HfuLP24+gFajyO
         m8UgNRvfBaC5rLWQUisT7IoRd39U2Q6Ewa6TwCzrH4DK/272kzyxQdVSYAO18Vx+pRbD
         L9L0CjZvlgI1/0CO8ZMPUJGJJ3voPgJ8ZI5e8j0oNL9nB4Htg6X3q9MGasBgnou+ASKW
         F6kw==
X-Forwarded-Encrypted: i=1; AJvYcCV+yWudhAeuqXq2MlREHoyh9ZJvFpAbQGK/ZYIeiQ2wOEAPe5iIYSGpsermXVQaD8kw0koGGofJMDk7qaulpaPeT+/edz9teAloduiRigEZ92M=
X-Gm-Message-State: AOJu0YxQmRXv9RFMiUywxK04yqC1sdN/Fwgv9gIJGBKmEbupn7Xr3R/E
	tP10Thn6QXO2wivDPc4aJI4cmjexFk5jeWs7fDeYkcUNcVfeq+SD4lf66XGdOtU=
X-Google-Smtp-Source: AGHT+IFMulAQp2dFZ0Q7CZL4pR5DvDvO/9NEVxfbIybQWLY3FZZ5OUXvmdGImHkWL/GlP/fLlPTrQA==
X-Received: by 2002:a50:99c7:0:b0:572:3f41:25aa with SMTP id n7-20020a5099c7000000b005723f4125aamr8735212edb.11.1714391336676;
        Mon, 29 Apr 2024 04:48:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id y43-20020a50bb2e000000b0057000a2cb5bsm13549651ede.18.2024.04.29.04.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:48:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/4] ASoC: Constify static snd_pcm_hardware
Date: Mon, 29 Apr 2024 13:48:45 +0200
Message-Id: <20240429-n-asoc-const-snd-pcm-hardware-v1-0-c6ce60989834@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAB2JL2YC/x3MQQqDQAwAwK9Izg1sFwXrV8RDyMaaQ7OSFFsQ/
 96lx7nMCSGuEjB1J7gcGlqt4X7rgDeyp6CWZsgp96nPDzSkqIxcLd4YVnDnF27k5UMuuCYaqMg
 4DkzQjt1l1e//n5fr+gFMAIkPbwAAAA==
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=8hlbxDVsli5Uho2Dc9zk1d5MLlzWuHE+5PgzBXH717k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmL4kgxXlqNnnMKJpg2EaIkw0QWwus3XmTLMuWB
 hWfdwwddXWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZi+JIAAKCRDBN2bmhouD
 14MsD/4wk/fFPGuo07Tc6t4ZBVVny/yf56kqMyV3UPs7GTN7fgENz4Vs5Gin8llVwv9nvvbIrfh
 cBrBJ53HMb7tMNtKDhoCjXLKV6y/XFF3OcjnUu8dFKF9+HWsntLk2pUa7XZf/m3xuCoFz+I2+2X
 FtEvt7tK7J1L1CbOP082IC4ZkhfTVvhN7VjqiC1AcntknqAwCKb5II6RAtl044X2cAgHBFXI7B1
 Qo/+a8PGKa0K0uBnIoHoNp75nHACjabA/jn601auP/o6zvNEBbjmG/1jviOgBIo6/+12fvjPqxx
 E9EcND0vFAI4b2W8IiR2Xg4uWuTtkzGOQ8gVmSQMUY/Xqhgulo8rrUYpnIV5JlSObZpNZstIdHZ
 3di//AnjPfGRIgVC0kO6jiOPGtCi/WnZe8zyg1tkArBgsmXLIXbuACRbR90yWnYeWGk0Ny8w76f
 T0pJ7kVVgxhVy84se9GzdxXC3V4bBs8KB0UmtCrmfQTKLG/ZcYUIptvLIejPfxSNAnOYcSN4XMu
 DF8BifoTInlQ+Xw9QYLBMmT5zOa2kXfIiS04T/C0Z55+ur3NPpX35/hwD93URXyFfrBLnClmjbo
 PHSEi6tWOFhgJAg8kZWEuqJOx4/8mOJxKL+LiIkCVek5bgHt7OxbuIiY10JdZB1Gy6BujtRGdnc
 RzHz8OsHOxt8zBQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_044859_838311_71342DEA 
X-CRM114-Status: UNSURE (   8.24  )
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

No dependencies.

Static 'struct snd_pcm_hardware' is not modified by few drivers and its
copy is passed to the core, so it can be made const for increased code
safety.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      ASoC: qcom: Constify static snd_pcm_hardware
      ASoC: fsl: Constify static snd_pcm_hardware
      ASoC: meson: Constify static snd_pcm_hardware
      ASoC: uniphier: Constify static snd_pcm_hardware

 sound/soc/fsl/imx-pcm-rpmsg.c    | 2 +-
 sound/soc/meson/aiu-fifo-i2s.c   | 2 +-
 sound/soc/meson/aiu-fifo-spdif.c | 2 +-
 sound/soc/meson/aiu-fifo.h       | 2 +-
 sound/soc/meson/axg-fifo.c       | 2 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c | 4 ++--
 sound/soc/qcom/qdsp6/q6asm-dai.c | 2 +-
 sound/soc/uniphier/aio-dma.c     | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)
---
base-commit: ebbaba914053d8bcadd7d64eb8d2555299509a27
change-id: 20240429-n-asoc-const-snd-pcm-hardware-f0a5ade885ca

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
