Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D8FC369DC
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Apr 2025 19:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OlSKJEjXan+XrxPeFubcrsFNFSbGCfNi5iblgJg3bT8=; b=nXRGAuSJEIISRe
	E+OJatnkfegRAjFweQP99y4XfczOgncC2figGVA119kRWkCFr0feHBnQFTWjRd3D1Igh6NV2Gq1p1
	vz9EhvjN9YrPG1gvjAXScgBjsmTTz+E8qWWZqdXs4qVL8HVoBkLHRSsMd8iGPqocnQyVAxBbRmyHd
	f8ga1MM2fV111Q+1JayWo5LCfpIanYIdpK5028Or9FEAX1xOJh8i6kUXlfkMieW5Dj9ek1sRXzGu1
	Qkut1cgBlTtjxZizlCXfIVHMlVRhj3GONlnEhPXkiOPW8IAFd+yNh2phEjf6inZgDPrx+Lw3FOAnX
	DAnZQATsErCwQ65Qg01A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9UFj-00000007M3v-3Q7r;
	Mon, 28 Apr 2025 19:34:55 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9UEM-00000007Lsv-3Udk
	for linux-amlogic@lists.infradead.org;
	Mon, 28 Apr 2025 19:33:31 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-2d4f832069bso2662847fac.3
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Apr 2025 12:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745868810; x=1746473610; darn=lists.infradead.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fX3wJzMvCpmppQx9eX7xDgMDyv3PO2lJW4kBkq2APOo=;
        b=HZCm258fuO18ee1VpzlH9cjGCBuGlGAqGL6dWF9KIEnr0jxZnL+nK/ZM1UR30e524u
         riDjfIlZaisM9gqIdyUFCfvUXUcCKNkvmxvwerysuBw9EpXcYkHCsN2HNykao8AWaAux
         Fx3cp4af0dHFA+NaPHfWj3xN51kMrn/gp/pNatEvzHUf5WXZXU4jHtnJixDBONufYM00
         H8dUqm/aRuaDFKnP8k4RqEvcjol/Jag5SeCFMXReKac++LTbgs7IujL/R9awlyvqLhn1
         X3ANdP1qePElq3qSKB9G1LftpsY9EM5ltWL5Bl3w43jmaww2YkgEghp6r8bGzICyQzKW
         XgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745868810; x=1746473610;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fX3wJzMvCpmppQx9eX7xDgMDyv3PO2lJW4kBkq2APOo=;
        b=klEAT3pFkyypc994C7yWKMmVB1m2QmBW+aPSTRGYusDfXXWvBBuNagmqHFFfeqg3Pu
         zIjz+puYsjySInmM7lvr2DGw3Eo84EIBjHpXiDK79aEi8yYoKo/O7pPEVBzrzWtg3zyh
         W9o89Iyug7D4MVRMoibNbUflq6HarFe8rt14wlSCd5pOVxA0L7vnWL3b2pbhOUofccWI
         Mhe1YD4+UaoKtZBDWUCDqhcQgu6vN310vU0NAhVoxqM11eL3fln6aNG67mPJYc0Und+i
         Aopg0FOyG9vQ8g9HYFbA6oSHd6JdaP1XEospJ8THsNI/pjgolk4pvWG0bUv3CQLlpipY
         pExA==
X-Forwarded-Encrypted: i=1; AJvYcCUMlbtDM1Jm6mqcWysRU0/LjN6cyMY7DDO7/MmO5DjiJAffEd9/JhSkU4pvIv4NTB2VyzzRfrc4JSvjzdbN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8x7PDy7rwnWFl/YeegSB/6n9ckARK0F3tU/POsjslwzQ8Z8Wn
	XCNfVNxYARGLv8WoXA1tNKuencIDBQVIJN999qI+rkTxZ/B3Hpzm
X-Gm-Gg: ASbGnct1ZIRRbJs6wtF+jrwZEd2PyLMitcmtrzdXqJe0qbkN7ObZ3qW5QEWtLREE/tx
	aQYVyBEHbf4Qor99tCHfKyeXOhjhejG2LeiDrviul3Pw15aTHU+m3jn4xpw6UdOHcNBkSIok1B5
	GVFE+PK/VyieGLOn7gfAPAupyoUVSiLgA7N3rof4BaJD1zz6meqpjMHzHLPvtUT60wfc8wgT4lN
	TRA1RetYH5gtfL1X/UkYQdKorGojPELQ3ofe5giRlmPKCrwVUIiybiLg0nWhk8MnxXld+9rYOsV
	4OVeyaN3EpDI/xHV4IVx4XRjHLA40Z7s4o97dHPxDw==
X-Google-Smtp-Source: AGHT+IFucS+go6LKq+JUwgvoDuptmo8PyOjo7aYF+zk9OasgwvP/cfm1kll04Xv8npNY6Lsr5M4vWA==
X-Received: by 2002:a05:6871:33a0:b0:2d4:d820:6d82 with SMTP id 586e51a60fabf-2da486a7c1bmr53271fac.26.1745868809865;
        Mon, 28 Apr 2025 12:33:29 -0700 (PDT)
Received: from debian ([200.92.175.161])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d973736065sm2447490fac.16.2025.04.28.12.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 12:33:29 -0700 (PDT)
Date: Mon, 28 Apr 2025 13:34:01 -0600
From: Your Name <kike.correo99.f@gmail.com>
To: daniel.lezcano@linaro.org
Cc: glaroque@baylibre.com, rafael@kernel.org, rui.zhang@intel.com,
	lukasz.luba@arm.com, linux-pm@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RESEND][PATCH] thermal: amlogic: Rename Uptat to uptat to follow
 kernel coding style
Message-ID: <aA_YKeU45ZTXYUes@debian.debian>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_123330_877550_82ACE5E4 
X-CRM114-Status: UNSURE (   4.48  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgRGFuaWVsLAoKQXBvbG9naWVzIGZvciBteSBwcmV2aW91cyBlbWFpbCBiZWluZyBzZW50IGlu
IGFuIGluY29ycmVjdCBmb3JtYXQuClRoYW5rIHlvdSBmb3IgYXBwbHlpbmcgbXkgcGF0Y2ghIEni
gJltIHRyeWluZyB0byB2ZXJpZnkgd2hlcmUgaXQgd2FzIG1lcmdlZC4KQ291bGQgeW91IGNvbmZp
cm0gaWYgbXkgY29tbWl0IGJlbG93IHdhcyBtZXJnZWQgaW50byB0aGUgYHN0YWdpbmctdGVzdGlu
Z2AgYnJhbmNoIG9yIGFub3RoZXIgdHJlZT8KCkNvbW1pdCBoYXNoOiA4NGZlMGNjNmZkZGI2YWZj
ZGNhODM4ZDgwNzU2MDgwZjg0Y2Y5ZWNkCgpCZXN0IHJlZ2FyZHMsCkVucmlxdWUgVmF6cXVlegoK
LS0tClNpZ25lZC1vZmYtYnk6IEVucmlxdWUgVmF6cXVleiA8dHUtY29ycmVvQGdtYWlsLmNvbT4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
