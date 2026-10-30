Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC10606A31C
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2026 07:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mi+t2ZzT;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cNkUGCpY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GFJZga5Lmwy5yiWotuFT1Tat5NvTv5z7/b0vSZt5N4Y=; b=Mi+t2ZzTmWvT1hNlyguCLhCmss
	dtLei8n/TWymyMerywHD53JoB8D2A61nO2zEmfUy66pxIB680TwZPOab7TPbIv5sDSXnVEpSbtXk3
	dOT/6mPe6lU31MVN6UqBfs5MHUJQnDDoFgrKp8kzQB/EYb/6h2UbL5X8OOo07bHKKA3iGDoqwHEvG
	XkgZfZ5Yu9haWHeYtSjDERrjLw9R3it83UN2O/RDx2yh+2ZQu/4uR+PSyPWLGD2epal6TLimfWays
	+THkR2sytHNVkFYRNn9UnL5PvAOl7IhrvorF3YEIYTdb0MBuZnRXqrEHUpHBZ1VAVIZL5y68tjY9k
	t4Ozh3Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhTR-0000000B3Q8-1rv5;
	Fri, 30 Oct 2026 07:56:29 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhTN-0000000B3P5-3pRW
	for linux-amlogic@lists.infradead.org;
	Fri, 30 Oct 2026 07:56:27 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso3963965e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 30 Oct 2026 00:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793346983; x=1793951783; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8dJssWm5QoOE15zN0DOMTDlBMnhnXDibO0tKV4NrqOI=;
        b=cNkUGCpYfH3cMnPpumrj28J2kecDzr/BqQCHzfTPJzpbsYm4jLzlwzk6WcWjsoOuaN
         OheuapF7AcZ3l+OUWk+JNRGx6tT/Lvx/PCM6yGEA99hWE3QEKTRk4VLT8VWlDOD0zIYO
         jzu29PZp4Gm0ZAqcbbOvxfDWzoPXJEnSOBsKyYmSpOqZ6NUTB9cfLqdQ61pGFBkxr7nO
         o3YTEc+6/EQSqAsAkon8MFrQaoTKViP5XS3uWuF/2ofMMmvBJq7lXAFZC60QbCUiGyUT
         uulbbg/lSHoFr4Ie9h6vZTStfpl/B//JMmfC7zgqyZAL3ofBYMDvHpq9zR/SpznUjcYj
         d3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793346983; x=1793951783;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8dJssWm5QoOE15zN0DOMTDlBMnhnXDibO0tKV4NrqOI=;
        b=AxRMeuPIwrglZ37PIFzTjekMamHsEyEHOUpwg23LmwQkVGUD1x+tX0kEuAkdpqaJI0
         lRRV3rKjTOdrWL7v6U8bT2xlU0WbGipS90ncVqHvNEB+xmRM8tlQnHF06wpr+Bly5yR2
         6zd7hA1/dErmYDMjQtoAjxMXR1SBQCDMzhTiIWA78yAf1pEWISmqEEIZUWuzcob1+5kC
         UZIhmKxtD/nYNalIiEig8orcfgbExj8NfuGbGAoicSYV7FFK3LWewK7qJVXIQaiMEKLk
         X9SBJPWxAdSYh2EmpNXM8C1DhasKkmFLvjo7VrsvCxAzbVtv55w07acTj3chLKUzGlVg
         0Kxg==
X-Forwarded-Encrypted: i=1; AKwUvBzEqTm9JgfJQvAptAtqB7f/qTJ8JetFHOUtpaswA4g7OgtPPLiC3IO02HKle9Pg5cJWUcLHKdNv96Og5bBr@lists.infradead.org
X-Gm-Message-State: AFq9FYKcDBcvRxMHU2B0mKlVMKyWIYvhZ0eI30B9gY+LC8HMpEjAdkza
	dho+d5Uk0pPkRR0kxzQwS5n96xiDKjsvcrPg0M2/Moy6MQ8gVjZTe6mCyVsVKY4V73+eeY/vfPr
	Cv9ITi3Q=
X-Gm-Gg: AYBFou1DBajhmWJhVNdLjEHTC5J0VoiEN+aJS04qRUJZ3zPEqD9AkcmxdPqgyHkrJcF
	lixZGTWHQtiM9v2kNi8pqo5rTpWXo8/fRS4rVb8hjKcEkV+GUPxBlYgI1bptKCBYR2xcablV8OZ
	VzK9ADihDY99QJXC22gmuOg+2c6vPEbnacNJ9CBexs0Ar2vjmrbhgCWSsf9X46HQ5MC7qua+8jn
	8bzkRpBKMDD3Ht12ZzCvoMf/2tixFrfZK3b+eWzlgp6ulVOaQVZTZ/n33LHB9wB+lBgicpKiYev
	+tvNUDruBZ9+qGkD5OaVrnyxvx3H5ZM4u5SwKMlyVC+FHHifatoMs2Z5LJrNC17VaYxQ8pYIk+R
	O2nin6xVw3dGFt1ry8WWoF371xhTEgOAksOyXJ0EWirKoVuEJ5w/LE6azd37za8Ff1MveRLbF0M
	9zhcvRljJ5h6SGzVVUP283DA0IQplOiaQzclMkqUpVfU0RlSQqlZaMfz9rFqEOOb1MIpFaY4cNH
	duq26Np/0ajM1IDCj8NK8g2+QXKaKMtkwg7nAy7X51wZFzhLMkVdcMGWUGrjP6uJ52bPOyGRXl+
	Ub/lewIq15TFAukqW02I0mtfooWQz1qauv5izeL6j0fH0+yi
X-Received: by 2002:a05:600c:848c:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4ac17d19e0amr27983065e9.18.1793346983717;
        Fri, 30 Oct 2026 00:56:23 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723cdsm1896842f8f.12.2026.10.30.00.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:56:23 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/3] Fix the ENCP clock select field on GXBB, G12A
 and S4
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
References: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
Date: Fri, 30 Oct 2026 08:56:08 +0100
Message-Id: <179334696866.1865333.15281691536960205924.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=349; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=yU+vJw6/Y9vZBqgM9DPcf9eaGw98kAzxSGCAE0ufIe4=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlPfOfdXWhmxJXoz+huw7YuS2jSZs/mnjdOR+V//eqXk
 NnIeGhiRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACZScZGR4bWVSPUD9laR6frZ
 +yeFNLw65Poo+IMTx407XyyU+JwF+Bj+qbpdOeOS4l3KXKDVuEz8ShR7lmvmhLvGi0rOPhJ0uve
 dBwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_005626_041860_5476B002 
X-CRM114-Status: UNSURE (   6.80  )
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 29 Oct 2026 19:37:33 +0100, Carlo Caione <ccaione@baylibre.com> wrote:
> Fix the ENCP clock select field on GXBB, G12A and S4
> 
> The GXBB, G12A and S4 clock drivers place the ENCP clock select at
> VID_CLK_DIV[23:20] instead of [27:24]. Fix it in the three drivers.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
