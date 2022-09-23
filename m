Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C250DECAAD8
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Sep 2022 09:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4fkc3Mjcc9Q9sMJqwb+oGfsPz4OXTeFyoxxfN60L9lo=; b=IfV7JwDUOSJrV9
	Oh+sTP33TIyY9kn7otjGIXFnvGRETVxn4JvilGneEW6FWN33QiWOgR5npf9W8VFl3ApsjacdvOJLj
	Y5y8ZSux0mTwej69q8rUJgiPQszV9JXfEC7eRY61Uvv7xwFbpWuQjWWxZNUMnHnHBXy4Y1F7vyDuo
	876Tz27BA8T4Q3pg2pG/wymbQTJCIchq25j23K9JM+v4gpMniKJO8I4X1pz4xOWr7jMDkYgHOhYxD
	GJ0uQPbEI1TfkcEBjom0GDBlurrqdMmiRn3NBM9xNW/pCQ/s1Vn9zG4BZYmUr8pMM89stBY4ceyPy
	De+TrmR5ixSLoNJWYlpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obfIP-003TlZ-UX; Fri, 23 Sep 2022 09:48:34 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obfIK-003TiM-TN
	for linux-amlogic@lists.infradead.org; Fri, 23 Sep 2022 09:48:31 +0000
Received: by mail-wr1-x432.google.com with SMTP id cc5so19579969wrb.6
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Sep 2022 02:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=4AgClHn7Pp2uPvo8c3dWidnYZ+2Ep/rXWim+T66RrUE=;
        b=iPFVdFgJUHJwjqRrqGguHBvS+j6YmR0K1gQ7nj38rGxQnkugr1+aCOfk3mQozf5vSJ
         sXAQ3ITkO0WtwV80sfVftt6ohs/OE1GQZEugAkXvD5BC7PzF9vfNnXfup22g7BLJNFov
         CCfun4sbJtTjNcvIMfSjtwRYuPOtCtQtDSK0AYba1AT5jAlzp0e32DhYqrK0GroRTNiJ
         neV1KOs1Fk8e9flpUZw5OOA3+t0pmIRX4Bcep+dQHsfmh68tZVDq4PVKfSsk8pz85qos
         s6oA8wbhaj6C/mTy+jdkf3JFyGEAVu9ixKjoTD7wJCrZgdiHklnv0M+GnDG3eLrdlVx4
         KbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4AgClHn7Pp2uPvo8c3dWidnYZ+2Ep/rXWim+T66RrUE=;
        b=J9pUN69HDqnMVChMiQPoUxukspWmY2HTZpNl3hNlJLgjs9NkV6sxrq/pu3A1TF+ZrP
         SV6y8iElBLccYxDOPJC0a5xnv+lECIS2pBH3mPn8yMC0JLAWodF43EWMxdF3X6AU5ch9
         CTJkW7bJa1ktaiGR7GMeB7pB+LmIrRtADB9WqFSqkHL6VJZP+cDnM384Kd4dKy6UIX7T
         IiWvj8XsASoWZHb7ZHqEqfZXhIW8KNa/+ir7EBk3ix4vrvo19wZrtp9fFb3XjyeuH81h
         JstYt2vsS5W4NWrkvKXyTJLcoU76aJlMyzbfopR7UFORTdrmbyDEVKtQCNUSJ0P+EIf9
         VhtA==
X-Gm-Message-State: ACrzQf2aYP3/zn4YzrT5P6Gjy8HE03sioDclf7HMER8woz17WlKP6u13
	j22jYVl5Yv1+mzFWOt8APh6Yiw==
X-Google-Smtp-Source: AMsMyM5m0JaAXR3jCt1aFyUwdIouiT8PFE/Gl4fpKqtq+cXj6R0GtM/jMmToCmMyGEd2QZKbaeVMPQ==
X-Received: by 2002:a05:6000:154b:b0:22a:9683:3a2d with SMTP id 11-20020a056000154b00b0022a96833a2dmr4430409wry.369.1663926503640;
        Fri, 23 Sep 2022 02:48:23 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id fc15-20020a05600c524f00b003a5537bb2besm2207571wmb.25.2022.09.23.02.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 02:48:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: narmstrong@baylibre.com,
	linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	khilman@baylibre.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: (subset) [PATCH 0/3] drm/meson: fix use-after-free driver unload issues
Date: Fri, 23 Sep 2022 09:48:20 +0000
Message-Id: <166392648623.2713441.4855173226833307532.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220919010940.419893-1-adrian.larumbe@collabora.com>
References: <20220919010940.419893-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_024829_071926_056E3C36 
X-CRM114-Status: UNSURE (   9.99  )
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

SGksCgpPbiBNb24sIDE5IFNlcCAyMDIyIDAyOjA5OjM3ICswMTAwLCBBZHJpw6FuIExhcnVtYmUg
d3JvdGU6Cj4gVGhpcyBwYXRjaCBzZXJpZXMgdHJpZXMgdG8gZml4IHNvbWUgdXNlLWFmdGVyLWZy
ZWUgYnVncyBJJ3ZlIG9ic2VydmVkIHdpdGgKPiB0aGUgaGVscCBvZiBLQVNBTiBpbiBBbWxvZ2lj
J3MgS01TIERSTSBkcml2ZXIuCj4gCj4gVGhlIGZpcnN0IHBhdGNoIGluIHRoZSBzZXJpZXMgcmVv
cmRlcnMgdGhlIGRyaXZlciBkZWluaXRpYWxpc2F0aW9uIHNlcXVlbmNlCj4gc28gdGhhdCBkZXZy
ZXMgd29uJ3QgZGVhbGxvY2F0ZSB0aGluZ3MgdGhhdCBhcmUgc3RpbGwgZXhwZWN0ZWQgdG8gYmUg
YXJvdW5kCj4gYnkgYSBsYXRlciBjYWxsIHRvIGRybV9kZXZfcHV0Lgo+IAo+IFsuLi5dCgpUaGFu
a3MsIEFwcGxpZWQgdG8gaHR0cHM6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9naXQvZHJtL2Ry
bS1taXNjLmdpdCAoZHJtLW1pc2MtbmV4dCkKClsxLzNdIGRybS9tZXNvbjogcmVvcmRlciBkcml2
ZXIgZGVpbml0IHNlcXVlbmNlIHRvIGZpeCB1c2UtYWZ0ZXItZnJlZSBidWcKICAgICAgaHR0cHM6
Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MvY29tbWl0Lz9pZD0zMWM1MTk5ODFl
YjE0MWM3ZWMzOWJmZDViZTI1ZDM1ZjAyZWRiODY4ClsyLzNdIGRybS9tZXNvbjogZXhwbGljaXRs
eSByZW1vdmUgYWdncmVnYXRlIGRyaXZlciBhdCBtb2R1bGUgdW5sb2FkIHRpbWUKICAgICAgaHR0
cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MvY29tbWl0Lz9pZD04NjE2ZjJh
MDU4OWE4MGUwODQzNDIxMjMyNDI1MGViMjJmNmE2NmNlClszLzNdIGRybS9tZXNvbjogcmVtb3Zl
IGRybSBicmlkZ2VzIGF0IGFnZ3JlZ2F0ZSBkcml2ZXIgdW5iaW5kIHRpbWUKICAgICAgaHR0cHM6
Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MvY29tbWl0Lz9pZD0wOTg0NzcyM2Mx
MmZjMjc1Mzc0OWNlYzM5MzlhMDJlZTkyZGFjNDY4CgotLSAKTmVpbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
