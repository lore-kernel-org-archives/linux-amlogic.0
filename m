Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD12660B57D9
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Nov 2026 15:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yusvLXLj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Dsi4vAol
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eFEg4sBzBtXlvLkgUGWD5h8IlyK1/YkWF3kDN1dWiD0=; b=yusvLXLjtmGKm5C0wegVFt+bje
	u+iiiP+Q3we6xRSNX8g6P5EiF+nKoJ5lDxP2eZi1v/GimWlF7LquWvHFhwCoxPjiLdq4CFrAQVlqn
	+wrVUt7Zryw7bFIDNJWCtk2oRz/3A2qKVdTGuyq9AKdAhBJ1l1l6jYgqX1sf807DPf10BsL7Ibu0o
	lgqMg9UARfsm7RPMNWobed92zzUD5iIUH6BIgrMSTk5USpcf4WF1jiSbvBOC7gCTE6UTbFay4ggRR
	Y9P/1tFn66jdsSdAJp6E7UbT6aSWsGRBa0hhaOOtMB3CRf+2t0LclIRpjpDX/0PiO17FaaSCJ57sx
	WW9Jpx0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtkx-0000000H1l1-43zW;
	Mon, 02 Nov 2026 15:15:31 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtkv-0000000H1k6-0TRG
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Nov 2026 15:15:30 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1837904f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Nov 2026 07:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793632526; x=1794237326; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lwko6okvSNVg/jnBVKvteCXR92d+R24Bf36M7tO1Ed0=;
        b=Dsi4vAol6uTx2gVNS35+o3ZvYhaLO0CAiDe87zjwWEokJBMVqYv+6HwO2KeXvKUUKp
         SK30Xu9Ssk4SWuW1QJvfJFAZTPC6+0gQx1L84wZTNen+QxgSrozbp0XO05DBieHCeBhP
         qVTXDqiChcERSE9BW5C8apfSanycVSUZpRMtmrZ54tk0XThNcB4RX8IgMEZAVBDhrlh5
         +F2brnrFX8hVF1nKkFhDkidMcDGWjD8SU1HCYctNferkZM59rg2ygFpCvTnBKR9/4lOP
         6I9+0uts5J06hRbMCrbEOOMczgaxNUWk8k1fdtZ9mM6+yTZDtT0WEV2hXdQVo1CS8gFr
         uJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632526; x=1794237326;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lwko6okvSNVg/jnBVKvteCXR92d+R24Bf36M7tO1Ed0=;
        b=OJqM/d6p3713FIQSKIKHnAJd4r/UH2FWLRSU99TAbe3rtY9rE7F/X7Ddg2rZOMAp8x
         2PZjFLe1O0ISzcxpOabPWn8Q+Oslao/wHky9DDY7327WS2NzcyGqViru0W6g1EpkkMFv
         UwOVO99vKC3YOh8VpKyKYCYiedHg2eXP6wqgGdKmJg1/HpZQigsLHUVBw5SGqFhHB2+B
         R8KSOA70RXGZafc0AfDRvm5JqEs03TP2BVmE8SFnS9aZf4F5vuoLWrXIt3zfM6xwBLs3
         KOkyHBmOpiBOtwpsY3IxVO4ymax6KDhIiR9mVrNAsKb8RS7aIDjNFULC28o//DulpzFx
         6PuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpN3dbHHGvpxnzON4RgnxQm1J7jcmVwqVIzYFJQZ5pk1xMajntAMbTzG15EiGMfnnglwPKocIKq8ll31dx@lists.infradead.org
X-Gm-Message-State: APuU4Z+fUPhTQ4MPCxRKfQnOZ9qglollI9MY0YXGbmCIb6hzU1V7+nhq
	2MDAhGgugq4vIUh7+rSHBpXHA/s2PZwhwpaqup3QqxUl5jecMZDVcMVWLB3/YgWGr+Z6SmyF7Vz
	Wqn48dvA=
X-Gm-Gg: AYBFou0mUniLhYBA4JkGcpYTongPFoSFJEhwEQjUzeVJ5QzQqt95cw/1QDNKFO7pDVC
	JTn5GvPgLCnOo8ZR2aCovhZ2/u85IwLMo5i7URHjQgXiEwxUK87o08+Dd1yR7I3U8k8Bln6TfD3
	jUbHzJJOkmPEtTT2RNSri6wCGTtTSr1Z0XrbXNj0x/SRWTBOtLyHVaPWwhDct61g7Lajwt3S2oW
	ux8D1KracAJloKEn4L6dWa0XwqGiGFBsrQ6H3DLWZpQRla0pvkz+kvEhK4ne4fPEV8kkbt7B+pL
	5FC9VxVzkG4w03I1Te0BgPhq2a3KYRqDhvaA9PYD8SRL8B5kcftcxyXOrzI0vUZugNUicpBMQVa
	fM5cHbNMhaC4z6mT8/7lcdnD7AnsTBOs0Bbt00HT00xCtYpzDKsgtvV78f4S+t7VOln5wtto/OI
	1v+WzVIrOSOk0yPngW/HiFg3lhWrXnyZD9NkjFR5F8CyOTHxQuTVJSPPFIR40vdYRqEq9zp19pk
	YhH2bgTB1/60J474lR+s6f+FuYse1Z5JrvFwxbgG4HB3SH7yhE+kDeDrfG7l1zHMz7pZxsHzoi3
	tGO0kcW1K4C+f7LC0kUL6Uz2m3gJGCODUqHpzxlCcvVoppVjcVzNXEqGhLmOCwyczJHeeA==
X-Received: by 2002:a5d:5f07:0:b0:48d:ef7d:4b4c with SMTP id ffacd0b85a97d-48e6e4f8c4dmr24016067f8f.44.1793632525630;
        Mon, 02 Nov 2026 07:15:25 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b964desm20278422f8f.46.2026.11.02.07.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:15:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-amlogic@lists.infradead.org, Carlo Caione <ccaione@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261022-upstream-maintainers-clk-headers-v1-1-d09dd4db01d6@baylibre.com>
References: <20261022-upstream-maintainers-clk-headers-v1-1-d09dd4db01d6@baylibre.com>
Subject: Re: [PATCH] MAINTAINERS: cover all the headers in ARM/Amlogic
 Meson SoC CLOCK FRAMEWORK
Message-Id: <179363251235.2870673.14649605942242408938.b4-ty@b4>
Date: Mon, 02 Nov 2026 16:15:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=218; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=cdtF+IoyulNvDDWLsBzOlK8XDHbQ0yPEZoN3CHTIrY8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFkvVvJ8sVbYu2HF+9xn65XDM1Jd43QWq/2zZOfkVywKe
 OHy52NuRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACZi943hf9oOm6dcXHLN/DMf
 PZRJyvlv6rpr2aSsORcCbLstlvzxmM3IcEsluDdb6sybjOPF3/9PyTK768OXKZxZ6ukkVDPlo6Y
 9HwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_071529_162344_5A9BCA67 
X-CRM114-Status: UNSURE (   3.93  )
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

[1/1] MAINTAINERS: cover all the headers in ARM/Amlogic Meson SoC CLOCK FRAMEWORK
      https://git.kernel.org/clk/linux/c/493e4ff653e5

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
