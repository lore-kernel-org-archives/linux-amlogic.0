Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAC3606A31B
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2026 17:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HwQxpXmQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cT5lrhgr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Pg1BlpNeHI1JHKYVgF1ZMEIWuZdgNxu0T30HIZY6810=; b=HwQxpXmQ5d1nTXfi9w1AYVMTzC
	jjh8F6rvfxD/X+QpLGqIhUwh9HsoI7QF3ZGxrRImrbG9EaU9bYQz4AbBCFsVMbQkPgUoc2Ih9ovE+
	HD20fHj022+L8K7eI3+pNCadtC/7qLA+8+asCzzafSwALZ9U6Bbr2/16/sRPE5WnFIjp4sHKagGZx
	RS7tsHy+es0zgiJ0+vsEDMPQorQhKsqefvjTXi6G4UlJOUX8AjwgOA2o4/Gob06XqKpif8Rf/QmHC
	urKRu0I2On98Dx3Ab/G43N+sBlBWbaFyY8rW+0Vu0KVJ5Ecg+Ne0wvZbSpVv0TuYDE7OZchlhx+2x
	8+ITOwHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1c0-0000000A0iO-0GVk;
	Thu, 05 Nov 2026 17:50:56 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1br-0000000A0ej-0Gtg
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Nov 2026 17:50:50 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so21255435e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Nov 2026 09:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793901045; x=1794505845; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T10mg0NCtNOcMbzwRpRiIpkOxV69UeTO/LUX0z+nOPY=;
        b=cT5lrhgrdQvD6/f1fBVB5d1v6P3unBgap6oVilGKqxEQwPI8KFLzuGjlNGo0x4Z4Rn
         tt82efkTqFpuzdy/oRo+TIfHFjqg+qqFN6LszsxNWhIpvVPy9zZ5GemwF1N/GLcj6jKW
         o5veuwbw69lybBmSx9Rsr9JXmCXZfyZgsStZxhZBMnkSce7JcET3arXywG99NuzuUySO
         ZKaQWq6Dls/wvlhn5jX7wew5G0TxJvKeqVC4qn9VJinzdw9go2R/MhBr2bIWTlbgFeVd
         CBrEYViES0xLcDsWyQPq02O9TSszqyYSjG474otg7RFyVovIqrvV5VqORAoGGroyf4HR
         M1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901045; x=1794505845;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T10mg0NCtNOcMbzwRpRiIpkOxV69UeTO/LUX0z+nOPY=;
        b=bBWcuSmFv3N5oj+BKPVgc7xxAg0fyrGqDjVGuEHq78KwlXmNqIo5iq4OmzQ6dZOwIg
         nQOsXuuCVWWjppe5+W+Yo1I2kZN1b0FyFxmuAJB9IC7IWYNpKW3/byHOzdHrJ00aoWP6
         F9jLrhDikfY/VbqzwguhCGQA6OkakGsC0y8oJH7fqebfrTAP5Fhkhd7ld1BTk+x8949K
         qxaIRp/lnu1e2mIpmfjDWQP0sAKF/Z94+urupgh3thU3PAaScATy4jqZ/EBk2xv9KqY7
         HvE00RqmgaZbHnA1dyKJVxtAiyjodMSDmZWs9yK2eSU6GfZWvFGvPG06iXn9jtN2KyUK
         5PEw==
X-Forwarded-Encrypted: i=1; AKwUvBxgHfXI2Ex6jA8Fps8VwowWhKcYtHIGltOMXhiq7zrbigJSCHaMgwN2MtxEFSTnyofyOn2y2yvIsAJbYClj@lists.infradead.org
X-Gm-Message-State: APuU4Z8ZCwVLz4BKbiicLkCgDODZ6M24ZR+96tgyVtGX4T6FfZ2IsK5u
	NGwa2mbp280hPa0z3nabK7Z0wyQfekeWcJpQcP42xwAo7FSl9VtkjC4xR2h8Yu+HMc8=
X-Gm-Gg: AYBFou1k0RDwJ6CMGVoZh/xYINTTrTE3hUmdDqH9uMe1i32GLTfldisQ9hmbFS73JjJ
	dSiMBpSWbDx+hSTkMpmFG4oz5ZUKw78htoDvuWP1AFh3XyZweHh4gRGtpPXpZj2XgOUtxiFndHD
	nmIOKb6UNzkiFpwub/HMUy8tEPs+NKdI5qn/Ir5KOZQJBzoEeaDHvTF9UuKoPekj6YRIUpCarIL
	LvRYE2NBYzRhrTHLD1lin2CVuJSc4+eBohFV2aIpFJvTPZ823QKeHZp6wxYTlDJtMRKFvAqdna/
	HMpa17gGe0Onb1GjLaJGtqyzNRz0I5Pmv39Fs+Dv8zf37bCbokJ3KRQyAz9CU1P+h3fnWDZ0WEE
	mrRsfyQLGhBdfUkZ0VHzkih6Cr3gx6ikdJnoWZLQXPCWW3CEw3QwIk9CyfXVIEaFOgAJnI9XOLa
	e8ihYehPAHg0g7BqoX2vxx7zfX58xTKS/pAbugdkgIw4ijUb33Ch4t/eTo+8QIFRvPVyjwahYmo
	xepi7i5gpTrY1HPiOA68R0ZC+WxgyaqCm8O/n5skLEOlBaplPZMlaKumycpuOpwNzUU95h85uvn
	sYuDI1B8iGxci3MTtMaiRrp7JjAthQxeCMBE1Fihx7R9M98R
X-Received: by 2002:a05:600c:6095:b0:4a3:7344:13b5 with SMTP id 5b1f17b1804b1-4ac182dcb98mr390804805e9.16.1793901045109;
        Thu, 05 Nov 2026 09:50:45 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm200497845e9.3.2026.11.05.09.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:50:44 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH RFC RFT v2 0/3] clk: meson: Refactor PLL pre-divider as
 a divider clock
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
Date: Thu, 05 Nov 2026 18:50:40 +0100
Message-Id: <179390104084.2573818.1569105668888286892.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=858; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=RepJ4XPfeKmVot5v9YpoyqtS578offaAhAsWd1iXvqU=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlvDn5uK2lTkH16raHEndtv5saPH5IMuqqOZpy7sclwE
 0/l/tmlHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZjI37mMDJtFdLed2ra09Lmo
 zrWDh2rO+B1+Oq+XJTNH61xGbjJDpBTD/3TGS63HFoWsmzpr67XN+jMYOd2f1k7Z+adJdorCzW3
 tiewA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_095047_123407_7223F065 
X-CRM114-Status: UNSURE (   9.39  )
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> This series refactors the Meson PLL framework to remove the dedicated
> PLL pre-divider (N) parameter from the PLL implementation and model it
> as a separate divider clock.
> 
> Currently, the Meson PLL framework models the PLL pre-divider using a
> dedicated n field in struct meson_clk_pll_data. This makes the
> pre-divider part of the PLL-specific implementation, although the
> Common Clock Framework already provides a generic divider clock.
> 
> The pre-divider is not intended to be dynamically adjusted. Each PLL
> has a fixed N value as part of its configuration. Most PLLs use N = 1,
> while a few special cases use N = 3 to satisfy their PLL input frequency
> constraints. Modeling the pre-divider as a separate divider clock
> removes PLL-specific handling and simplifies the PLL framework.

s/framework/driver

-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
