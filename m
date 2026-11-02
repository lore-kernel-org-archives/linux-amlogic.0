Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AAD60874ED
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Nov 2026 16:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ocTRO98C;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=n/QxLb3k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=e3HrIBvKvyju4nRSj/GRWrY7UVixAdNIsccaoVBPUU8=; b=ocTRO98CXlO49FKATjjorhoUky
	UDn7AJ0wAOk4Pj53FaB+TKtR1wr9vJnvEa1GtYB8ZabEbpgnT4QYvaQXa2Q63uJLAyJ1PkqTo7QsW
	HZnJF8YK7mEv8FD8jzzODZ0/63BGXPhWNZ1y2Z2iy4GXUQc7V+IwbjDhwwp7uWG4KMv3DspPBhQl7
	CbacZBO9JIAQQyqIkahNppZOOKWYQYdu1/5akWbauk/zDNexAZOKpXxv21yRyr0qFvVRmGYq91yKW
	LO6vO2ViBLVtZetSLeBMTO47m4hI4IYwOtjtCuMm7zQ4nosei1JaWYFEVSafmDgdzgmBx/9DExQId
	VkfCL6Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNutB-0000000HIHA-09cd;
	Mon, 02 Nov 2026 16:28:05 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNut4-0000000HICi-1aL7
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Nov 2026 16:28:03 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso1666707f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Nov 2026 08:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793636876; x=1794241676; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Yzw89lsinqooxl3AQbwM5bflwcgQEHrujUJ/xTqMIU=;
        b=n/QxLb3kSD+SUAgyDHqSpJyDTFRiIqIyuyqrKJ72noMfGkswPWpWUNsQIaDN2N5JP3
         UIbRRFl5MAaT31CeEzhJheSMgwL9DFCzuoDhjCVcf+Ic1WsuF1w44n2Vctarq3kfCrhL
         NmOTA/foH58uhU8zUiB/KojugV3l2Wmarp9rpiCPcrapjdKWiOHbnIdp16nzdwWpfBFy
         VwIfsOYucAScNUnaBcXn0Be6k5P4OJiMNY4gT6bDCfoG6gLG9XrlVtYG+Ri0VgfkeU/5
         Fng8PU4etuHEYNSvC2tmo0EkMQDEzeNahIXQoYKzDKTkrL3eEk0sNaKQoORMufXf0I3h
         7mCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636876; x=1794241676;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Yzw89lsinqooxl3AQbwM5bflwcgQEHrujUJ/xTqMIU=;
        b=mWN93KL1iZ+U7vHnCi76cg+K+W6LasDehZN0l0ymFPu6zPoqDW7H10WSX2E6/TJCc8
         GbgSeIhGHpyoHG//9Nb/UsnjG3ZL/x0wTuboCHKwivnnNFM1eP24es+MHL7onKFULMty
         m57DCrA9vWxxYhRP01BxqmT0kkGFSIbTY5BkLdM9G9TG6mttXSZ9cBYmElqy/rp/v2G+
         AxipfzFoRoJqaeu2g/wsaHYfhSTCEMn8zeRd5tuSYet6RMSyaVrjCqnY2l21mZEj+T27
         Ixk8SiIsDWMVU6jr67kmUwgrxeWFZRXkKWTReBRnJjMJ9cZHJnrYTLZgxQMQPEHm7kAk
         ywSw==
X-Gm-Message-State: APuU4Z8VGY3yniGxlUDwWHS5g4a+jFyxOBre58wmvTXpVTU4htUL7Gx2
	RB5Z0lXgb01OVl1MLri6JaIVK1U8GI9UdKN8B/MRHIJGQcsxCv0TvajN2fWpODqkEkI=
X-Gm-Gg: AYBFou27WBBDCQDyGBLkdJM6WwLQ/CGCK5bcsbrg0Vxgj6mh7rFSpFXuqBtdg0EHv2/
	kf9t96d1uStw5PQ6lM0uI3SX/vK4zvyLuHPGAA4taAkLALCnzMVhnKKABVSRNrX8GRNButlskoU
	8fHsj7+7tzWWgKpdXA9pIA4T9cQi6Z8BfOF4RVMDrk13zfRCkh4rbdHqxX/Lz1QnfC0b5oc/gOA
	7jOtY/qZ3ZVvvyYqwW3Wm9e05agn/IObe1mkpk6uzHjjejly2OmOetkTtcM5AjwlLZQ8DmHLKgU
	09P1MAyO7Sw+2Io2m8gQz7uZRhuMVVgnrkCU0k1gcRwdTTjufjaONZPe1vdeXT2RaRA+wUG4ksG
	QwcNM1OX7Huiwd4i2QNQMbKjkvrEVAXIohvZRV6/4fUh7EwFy/axWG+Tcc+xCCzVRZAk8n6coY5
	Q77MaSIzxg/mPNAu1KyZNr9n7UkDUjmADPXcbfj42W++QpL2KHVhKqoCnB21I1yRCtgWPse0YqM
	e8FMUxo7dElYOaZHpSleEJMIAS3IYeQTUIUPPIhCMYTj67HPECIPvKrijeTKZQPHnXbn9SMp2JY
	+xjxAFvuQ26f6zWwSwLpF+X4mIJ6MVbbzfzj8j+IFIY/dUAxew==
X-Received: by 2002:a05:6000:22c3:b0:48e:61c9:4e32 with SMTP id ffacd0b85a97d-48e6e505515mr22460208f8f.32.1793636875388;
        Mon, 02 Nov 2026 08:27:55 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d425sm21327567f8f.1.2026.11.02.08.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:27:54 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
References: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
Subject: Re: [PATCH v2 0/3] Fix rate rounding for Meson read-only dividers
Message-Id: <179363686177.2573818.9840227299008811238.b4-ty@b4>
Date: Mon, 02 Nov 2026 17:27:41 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=78; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=6Yzw89lsinqooxl3AQbwM5bflwcgQEHrujUJ/xTqMIU=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFkvdnHpxHrPXvaH9XIH+4SEyWdKTjDzFkYtFOY7YbPEt
 ljWNNW4o5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABM5dZ/hD0+n5LxFfV82ZzPZ
 LpyvGbFFh8d2+Z7r0yJVltn8e3RUezHDP9Oft5buYvW7J6K6Z1Hb+ym/t6j/8G1lnzSlRvlYf7X
 6Ri4A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_082758_452657_7118F32D 
X-CRM114-Status: UNSURE (   3.83  )
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

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
