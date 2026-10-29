Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F11606A333
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2026 11:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HDaLnqoU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bLwQbsqk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PuIIfU67zV3ZV0wt8b2IE5djUYu/Oc6lQyuE8U1M95U=; b=HDaLnqoUgbrJyA2FUk5j9ZsdIn
	LMEa+Avis7iTZJ7k5/u+QUVXXO5F4yVx87jqBzmb7eXhWZVEPydijFOzame+V0CJOVJ5FjxwAnUxs
	rEjj2mmaT/ziJlbnUHYeMLpHzZBZcbhynLyOKY76JQ+BQjChl4MSimNx6Wqt6llIBtP6CwQ1rCrn1
	8U6uzab8vE9pnKIbxdHardUyxC5xExteCqE0ipAAp/2BP+O5UjEuxKa1fulQNdC5w1QrDVFnJohIN
	N+XW/Uw+6wKiATYn8svFhOWOnycnZwanxwBj1Q0AmwSq6KUqiJhpOi2scxNAlNgVfibPVbLEKZuV6
	jQKP15yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNzD-000000092nO-1n5J;
	Thu, 29 Oct 2026 11:07:59 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNzB-000000092lb-1zDN
	for linux-amlogic@lists.infradead.org;
	Thu, 29 Oct 2026 11:07:58 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a215e64962so21257595e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 29 Oct 2026 04:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793272075; x=1793876875; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O73xnnUqQvELra/ffGr+ZGulR7alxp36K/afX4bZ+3s=;
        b=bLwQbsqkuvNYTTIZQPjCm5rVYYNRJH5Y2uuKygDM8nq2H3e4fd5RBEyIFINGe/HozP
         HXXXtfRTJnfwzNJIFVL6Z8eKJVrNaNPkviCGpPR1Xqc2G+SlQm4s8nGFk4qSnznoYYS/
         QTDamye/hA5PY4EUnmnf72uKkSVZszQ1ZK55CWXqxt8awXkHdccrM7/8lLS9gW9LPw69
         qaUH5Rq8N1gVZXKft2U6ME0whIHMGBhcSRZuwB5kfdcP78xtrR+w/ss52P+RkXaV4zYR
         lLEVoVzU0qivS/Yf4PwlJbzJt8bUDHCyg1SvOTDBl/2yWz2DL6qaFRXjCbITPS0tiTlY
         6/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793272075; x=1793876875;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O73xnnUqQvELra/ffGr+ZGulR7alxp36K/afX4bZ+3s=;
        b=oKAJyujJTSqeuPA9yDyTg0sQ50omDzDbrQETI1ikqWOORYb58wdCSmkXQhETqepQnl
         t1EhjS2CqM+CWvGeE3lrPJ8n7yOA45kEwis3URLc8+LmNxNfd1SkAkwSSasHypzF8AgR
         NOLmUgvMJmBqtSWPzWRnYAXKGZVIZGT9QYkDSKnYVYF4Iyx83ePoYcNH93Cq22BTWQvC
         /f7UehQCqEJYu2HALWODQm+P/9D+D06tzrLUUsCPNWE/8JHHTlsDB6Hc5qEbB6kF5Z4Z
         NpmCY9q4ZV9ADGNbOxH2rSTW6diWz7KS+PpdVeh0ViwBe1+wSBlLWDZGSglueC2j8bFN
         vYdw==
X-Forwarded-Encrypted: i=1; AKwUvBy9eef3jxq/eipcgntnErfWuGXxqsAhvhOT+cXMkJY8yKnXWQXHBKpLotu4pLJLjTAktaQz56i4qTHh/Kjj@lists.infradead.org
X-Gm-Message-State: AFq9FYKMm2JH7fF7CJ7IZTh2GBglwdrEx4lX128nCeS1C3y53v/aloyj
	B7p587/2FRzcNe8gii6gNOk8qRHGtlFA+M0ACwPRYqICxGaTawhUfYoEohm3Y/Ks6t2uYeesCuY
	VWZrtylk=
X-Gm-Gg: AYBFou3nRAExTJJFLHXwoK5mRqGOo135S9mZ4iesyM50NJjXzCN8mZdwWoniOzQ505o
	CtRlAx+w++zleNxXVP+vtt1fiKPpQVN7mkiWVI/Glr1uyye4UPc/Qd/+w0d20EZvoDQltj32Tfw
	Um7rj9q4bbJKoc5MdVsRAfwoYTlu3N5yUv7TIRqzSeIs+XzKqEVKIl12Ij95195Vh5WcWtY/MOB
	SoigYYnxkrZ7F0GfZsbqKvCbINm0NdYCbfRUgVBvSThBYEUwUCeKdWWffEvMQmQT+XSV02W8wQh
	6VjETN4IvFFoEWuVsWvjVM+HHXPAE8gFvJxD/3fCnWNDzyx0Yiol2zc/UObR/NXhiaPw66f9THC
	iN1pHyawxgMU4w+EUGYBoBuA4OkrOjAwsiwW5NsT5KYbNHzowNuE7yXB7d6lJ3REktXZ6t3KZ7N
	n7CXQODyKTvRr2u0Yplolm0Sd7DxtVqZKE8UN4Fj8JAsKqG9sb8g9ugveOEy1RJ5KLRyU9hJOpk
	tnfYDj4D05+hZgaS9CaZO+hTM5FaK9lSnV9+d3R+ZmP+V2c+FeJl3uCNaWPTwDywce/jWMGMTaJ
	0r2NBiom5FWdywByEB01GYfxfjbaWvLQIBldoRB/bstJHwJNUV1qYRAoGhVXohMRRNUxYw==
X-Received: by 2002:a05:600c:840e:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4a965dd3274mr123729855e9.11.1793272075153;
        Thu, 29 Oct 2026 04:07:55 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f41895fsm51035565e9.5.2026.10.29.04.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 04:07:54 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] clk: meson: regmap: use the current divisor for
 read-only clocks
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261026-upstream-clk-regmap-ro-divider-v1-2-c8216b0fb93a@baylibre.com>
References: <20261026-upstream-clk-regmap-ro-divider-v1-0-c8216b0fb93a@baylibre.com>
 <20261026-upstream-clk-regmap-ro-divider-v1-2-c8216b0fb93a@baylibre.com>
Date: Thu, 29 Oct 2026 12:07:46 +0100
Message-Id: <179327206664.1865333.6840169064466594528.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=586; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=nrVNC7hHxSqNoUqQLRJq4FIPYelw+3Hubgb0s4fcz7E=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFmPNTmumOoztc4onjjRI3Jmxovpf2OeJ7SY5/xuKV3pv
 8fffgV3RykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACbSJczwP03juURXa+0zXYU/
 u56nXgy9r/GN5TiH6OJfAmbdG2vuezIyXLtkpNMdHKzwRN1b7ofSgcQb547eWz7d+AjrkuO970/
 xsgIA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_040757_533991_1713021D 
X-CRM114-Status: UNSURE (   7.29  )
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

> None of the Meson clocks using clk_regmap_divider_ro_ops set
> CLK_DIVIDER_READ_ONLY. Without that flag, the shared rounding callback
> can choose a new divisor even though these ops cannot program it. The
> clock core may then adjust child clocks using the wrong parent rate.
> 
> Make the read-only ops always round using the current hardware divisor.
> Parent rate changes remain allowed with CLK_SET_RATE_PARENT.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>

Fixes tag maybe ?

With this

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
