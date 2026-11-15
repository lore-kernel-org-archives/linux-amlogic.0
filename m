Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D315A606A32F
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2026 22:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZYm9hEsk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gDe6LmaX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YjbMPm2zIEKfBlHpPKm5bF9KtQohj2TLBuke4f/CIgI=; b=ZYm9hEsk+19HYbdtqRAVLcNhJ0
	aLdXRfT0GTYcU/TLGJiW6PoiIvsJEfxqSHSxK2PkIgU3KjnHFFmpfgZxOdV0dC/JnG2H3vl4635hC
	MF0Fd2idMDFA0xk1aZyfh3Brrc2Dp6dUWN+0ksZTFzc+jDACOPqpGrnAlPDPtx/MmZqWBkkSvSizY
	gY8aBr5izddbVJByKbB5/BGxzsLU93PijrdINGA40t/YpEf9wgXZo8QmjwarB7Vg89Rajpoqn7aOc
	coSeqzalMIkXYvAUiepTVpKFnkeP4AMrvSfqxnjsTulo7ICPkV3aYr38zeVhH6/Mx2gw7D1RlmlEJ
	ASa6s+TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiqW-00000000fsv-2QnF;
	Sun, 15 Nov 2026 22:37:12 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiqR-00000000fqZ-44fo
	for linux-amlogic@lists.infradead.org;
	Sun, 15 Nov 2026 22:37:10 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso16311635e9.2
        for <linux-amlogic@lists.infradead.org>; Sun, 15 Nov 2026 14:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794782226; x=1795387026; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OlFwj0OOaMCtSwQfLQtif3SH0UBBq+9kAcPIWGrQLlc=;
        b=gDe6LmaX9UtumERrkNPTqxua6njSQP4493F1v37+eVkSGLkIiMzGFCHuu45Ni1HbBG
         jgUMbu1kgwszmo7Wmp7Bsg13ua36c05+3tUvvl8X9tP3o4dTZufQrDmDqswr2vIQElAf
         UbN8fruzk0MZHm0fjPGXh0/4kPLRWBCtCtmdYRsIX6idY2m5JxItRXhb80ie/01PkRlw
         kcAzTN0jWmea7QEZMRLdHco606JuK/YywG8FysnmnrdK+KEKhxHx5SFmG1tG3bTS68Fh
         /Xf/bYZoVFWxdrd1iOD2aBO8ilssgEnZ3tAYwdGbiHM7vqiRhzmiY1cEX9mXKmSQrWk4
         scfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794782226; x=1795387026;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OlFwj0OOaMCtSwQfLQtif3SH0UBBq+9kAcPIWGrQLlc=;
        b=rlEK990ookT0hVaWxb9LZDyD3Xbvs+LZHd0BN3Y1C+0qHJ+2C0HLpZOecDSd6MaR73
         vxEaz1jUxtcT/Rx1VkTRN/HSbea9mHp9ugJUumpbFYiQMfbT9l9C1x70CBfQdCZyWB+6
         qEf7MqVjIgp99nzu3F+AzvDOUDF8+tOFJqdx82MbgUiF4FQOmrSrmqGgcG4Z3BD0/A1/
         O1rR/oIz6cOoJGwTorKRwn/S9w/QEYQJaPP0HOzAYmClqBQN6WILlrwXQhxW1zyu8KqL
         pK/w5yJlUYWgU7SGufZtpJ11tavR4B5L+hV1OHyPpGHhYeqIKLQfUjemlvkG2CkeZNJB
         019A==
X-Gm-Message-State: APuU4Z/hpxfghlR12chT/cvPJbVvfukEXPuQTAbC1DgUHDBSoYb2NvTI
	QDejY3+iCKRB0NrXgsnAR+HOT6Pe+XSxvFcvnC2N/fcAuZxmQBY4U1mcjE7v5Fs773M=
X-Gm-Gg: AYBFou1h3EVfsBIXYcNXJ2cW/+MEMf5DKqM/rUYDwlAC1wCRO/hyjgYTpZ76XxZcaa8
	eNz8HQq/oVENpD30XLwxAC20dpaXErdNzNWTr0eZtVlgng2QVTwOqq51QNAAIgE9pG3MwxWcywp
	YSbMT2JfNHqnR+mGchfynTKBZg4T+b7D1oid/ixx8Nm00JB4bmiPU2Vesgr6gYGLmdRQCphIkW4
	YPiIdr6ub/vSqNF3ETdhOU/lxPvtFBfM8OGVIQzjWIp79JtRz5WHypU68RlIc/5m6vH6KWvJYDm
	vR7E0tIuAx7SvsmPqmM99omi+ySeZbdBfM04GDYFW1h4O5GmOgLl380HiQE88Um3IUKnBZeuX1M
	VrZ8MVsahBOHMIAdo3GU24GeZJ1pUDzTcbFyg+SKu/pvX8EtS2DmaNKCvj8hvntwYDBVV0XCFtf
	zTOYppw4XVyidB2YTXaLcpCQYoGCp7XW3PZdiX93XmZo8VeGsWnJ9Tnv84ZUceiY1csPpSG9d6W
	SDkEA3gdVibrZxMEKPeuxxQ6BPFiT7nPbESMSohe9se0by9bJUGq6UcHcsofgl2PY1knbAF3agh
	2wWED8aKnZ3bOBvSMXKW8UoLi+cHATgA4rqDZZVV+k3AlX8X
X-Received: by 2002:a05:600c:3ba4:b0:4bb:741d:ea8 with SMTP id 5b1f17b1804b1-4bb741d1220mr5026685e9.7.1794782225857;
        Sun, 15 Nov 2026 14:37:05 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7292c04csm27506865e9.11.2026.11.15.14.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 14:37:05 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: neil.armstrong@linaro.org, sboyd@kernel.org, bmasney+clk@redhat.com, 
 khilman@baylibre.com, martin.blumenstingl@googlemail.com, yu.tu@amlogic.com, 
 christian.koever-draxl@student.uibk.ac.at
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
In-Reply-To: <20261106101827.46467-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106101827.46467-1-christian.koever-draxl@student.uibk.ac.at>
Subject: Re: [PATCH v2] clk: meson: s4: keep the PWM clocks off vid_pll
Message-Id: <179478221481.13037.4595055180281805820.b4-ty@b4>
Date: Sun, 15 Nov 2026 23:36:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=190; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=kSp2XHPUdyj9arJE5zFouPgC7s5Qz4HXMfZKSQrP6NE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFm/TAR2851bnrrGinOP65LEaV2sCwq3rzVcpp2+lemH4
 cwdh74xdpSyMIhxMciKKbLUcFeLv5PU+jJrus5tmDmsTCBDGLg4BWAip2Yz/NOYuTW49Gm/6ZoV
 G1YHrvFptfdZafT5u+2+fzdjbRtO1QUx/LOVE65sn/R3te9l1yuzrse/cNlz8cvRu/85nq/4eiJ
 RRYAZAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_143708_026493_E6D6D814 
X-CRM114-Status: UNSURE (   3.73  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Applied to clk/linux.git (clk-amlogic), thanks!

[1/1] clk: meson: s4: keep the PWM clocks off vid_pll
      https://git.kernel.org/clk/linux/c/cbff55924b87

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
