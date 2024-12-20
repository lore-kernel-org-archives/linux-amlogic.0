Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DA5E7718B
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Dec 2024 09:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V2d3eRnuNRXmxUq+A3ec1M9b1D9FyTUzj59QsFUKs0Y=; b=bJYiy+HfT62g7b
	4pOYXqoxttDR9/yqm01IpOFmBcT2zSuV1uTBhOlScY2ZF6IxQ2lMyixyIMeiVMqnHpShzJFD27v/I
	K9LddAtnDhIwdX6lSfFXT4Ky2GT18BhnkEoSECgyUUFeBUNfRyIkPcmqlwOds5G3AMT2wEnqEW5FN
	WLjH371Bz6jsWuN14jP00YVpkAGgkXXre51hnFx/G+eSaEjX8JfYNsd4WPS/Zk60StidgY/nyFy7R
	uSS2KS76UkQuSWugaMLFYkLn1qPpI5uPziKVEVtfNB4pxDxLdncx9S/0PR4nOA6UENeqx70nvSTEC
	NokDzqr9s6aamJR2x3Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZGc-00000004Pz5-2q4w;
	Fri, 20 Dec 2024 09:25:54 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZEf-00000004Pir-31ew
	for linux-amlogic@lists.infradead.org;
	Fri, 20 Dec 2024 09:23:56 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3863494591bso925451f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Dec 2024 01:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734686631; x=1735291431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAGVHkBAv4DKPBWXbvZEL50b7QWLDGXfPoabj2FSbxY=;
        b=nN+1O8SFGS8wXVJekP0EKKqaczXoWIEDenzwG9oFCK5PMxTDIqZSq1e4TxTor1lT+3
         m7kcVWhnHmTH5HLSd8PZB5Z5NlesOJymUTPswokdUi5/htIQwElEfGVdYqoZt2TD/cwf
         jofs77c1UcZmrmBWllp4HLCwj9doxxd+aUZpox+aihbYpvfpSlnMHivNklm91RaOoUVH
         Fl3ofcLApwv7eDEfG2PGiCtM1qxxOFLl8xK9cZuv9T3RaTR9aJudZ3Sky4hBiAqvgEx5
         vVK1WNhFc8+jyzFnLfXa8/PlwWTn6IaucAoVm005U/A9fjPJn5gPrlRJFQjypBV3ke3Y
         Gu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734686631; x=1735291431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAGVHkBAv4DKPBWXbvZEL50b7QWLDGXfPoabj2FSbxY=;
        b=KmaSXfHI/rQQf7JwUZxzccTbFkJSQvsJIxbutkyktbounZ6pZ3n2kFU4UOQKunQ0Ez
         6MkcKMbkgOpDk+3qq/16CU1fPdhBlm7K+HU9zSShQuPtzwJSQz1ZK7T0f3FN9/289y+D
         fCIsm9IOiVd0HYQswtRnWiGT26P1C3ueFyrj1O798lnT8an7Ie3QfRLbU86oLVNeBimk
         J5SGPYdODRmp9Qvu8rkbVxTGuntkt5xV97gjd3KJMiC4S79KsppaS3BI5QYU0I8gRgru
         gfHDsOdCiAmV9oWimwinNt/w+WLShH4IxW59vVMqG2zb+e9a2OKOtEt/FiFFnFYwN3i8
         hYjw==
X-Gm-Message-State: AOJu0YwWNPSrc7IgPuyJNSjBWpn/SqSnxuIa4/QN0lWVjpV0dCPc1ZzU
	PZJB7FXtsqFOwhsbjdccRR+w+wXSFxF74aN5b4nD3BPdiAG76PEInh+pk+7Ff1M=
X-Gm-Gg: ASbGncsUfmPJQ6mfgyyO/rcfi9EsxpN/2pcDyKeH2q0/XGC0G5z4UKhRaqiX3/Vrqmw
	eezhDa0OUTL44gbnhrKYUibKlXGotbFzerZTDe/V27cmUPD6VXzrN1ybN5dnngBFU5nIGfmd3JS
	v+P/VpwIWmtytbsRZXrWkuTevxHgLHjoCpE6T8caoT2pkYUj6Jt6VMVapEho/b8mwX4pOHv3hu+
	jZLlGvZ5jn5+3bC0PcnoRhANOjRgWt4ij8zlZ6jkn8JrHXHTKwsBNgZBr4=
X-Google-Smtp-Source: AGHT+IHWOjD/ySetVcGFfENJkiWJiFBUr1+JfvjdK6eG9oGbSiFLzshOfEXMASqPgSzH7pcRRzPmsA==
X-Received: by 2002:a05:6000:481d:b0:388:da2a:e48 with SMTP id ffacd0b85a97d-38a221fb99bmr1646750f8f.23.1734686629442;
        Fri, 20 Dec 2024 01:23:49 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:c000:46df:1e3e:983f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c828f8fsm3538787f8f.12.2024.12.20.01.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 01:23:49 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: amlogic: g12b: fix cluster A parent data
Date: Fri, 20 Dec 2024 10:23:38 +0100
Message-ID: <173468657763.2759236.18371740322790756565.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241213-amlogic-clk-g12a-cpua-parent-fix-v1-1-d8c0f41865fe@baylibre.com>
References: <20241213-amlogic-clk-g12a-cpua-parent-fix-v1-1-d8c0f41865fe@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_012354_020079_BAA0CC24 
X-CRM114-Status: UNSURE (   4.13  )
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

[1/1] clk: amlogic: g12b: fix cluster A parent data
      https://github.com/BayLibre/clk-meson/commit/1909d0d351ed

Best regards,
--
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
