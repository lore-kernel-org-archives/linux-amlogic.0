Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B53F60A2638
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2026 09:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=moU0srl8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IZivf0kC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oTdiEQPLLNv9FTBvAIap64Ctwl7mV4IFmXsFhppDq0U=; b=moU0srl8Bz/YO9y7TyP5FjWo1j
	TOSGpbkyTcEdpvRi8tJLeQLjk5j4E32FdMWz8HFvqdfU484Ej4SwG2V403wBzzWHKHx8vLkpC5+Hb
	rhkyoyeOYwhdJiS0l2bo+lbwTcO7yr6vrKEd5r2enzGDpFLvQRXH3tYIHgyfUKnd6d3KTHCpiSgLF
	JXJRXbmIAi/ZyqoJqnAFZ0I+G8hGsV3dXiEWrHcKcQVnH2RYU0xtO2/lBHK9H/EbVsd0hK7bEBXj+
	FRSPUxVI1C2TkP++TX/t9wfWcj+SHwTfGqAzEdIUPdlZtUHZQ8T2iP/sEqariOZoYr3U/AsfsyFx1
	LaT3YmLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBDe-00000001q9h-0BOa;
	Tue, 03 Nov 2026 09:54:18 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBDW-00000001q0f-1ny6
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Nov 2026 09:54:11 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso39663925e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 01:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793699649; x=1794304449; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/+vkM/8rbP5nhhINkxwcOr6UP8DzcWI1HFHKtdW0wX0=;
        b=IZivf0kCbZsT9bY8tQcsiCCBcAoTGGf/UlI8c3iU+0a/JJuGTvQAduX7FRDIFOE9CO
         ebXMC0MpqJSShPiayi4ZHTUxtf6DEuyqwemZ48v57q35F9kVJrqYy/ylKpX3ww8FqwT4
         HTv2a4P+79JrCb7RM6nldDhswMqcRECR/EmfO8G0M202Zl4ymabCiDE4qScj5k1rSyj9
         rvTisEY6yXIeMQDYgFTFyrv3U99EhI5faw91wGtF1xutQcc10L4mZXDhURZPCu6MPu1h
         u8VnDOWlL++kiEn05cfmYRK4Wh5a9GZmwT4hDx3yTykHvHyKXIQKMzyXTA0FtiMdlbl0
         DBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699649; x=1794304449;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/+vkM/8rbP5nhhINkxwcOr6UP8DzcWI1HFHKtdW0wX0=;
        b=RJiofi8ekurtWGZOaf5u8n6ecHF9rw99Oy5SlcjhmuxZg2uSoyywCPDeJBNu5gwdWS
         jJyuII0rj0wiCVyJK58EOPO95IVaErj9dc33AMjESDMyN4fc9jyWae6hVV6hJFf/8Wzy
         GHSn9dQrQogR/2Xfav5i96gluc6gXNpfO3VqgD7RUL31jEGzePlSzMIc7TTbNTpnQG44
         DnQYjGC4v5qRlEIAVSuPpCAHLe+NfEBHoPoa73sAe1JZvPWVv93W63UBqH+HP2LvJER+
         VQNGJBJ+BXTU6SgsE6AvIxWFm565gHiNb9dCKRkTvBu255a+e8bqfWK6pJuxL5xJwDr0
         TmPw==
X-Forwarded-Encrypted: i=1; AKwUvBxraxUGcgaoa0NL6MFHzS3F377jWKX9SapJYjECwYKlnXpxtQ4H+VuNxqUVJfZmjE5jOT7CkAFgvP0YENAS@lists.infradead.org
X-Gm-Message-State: APuU4Z+ROAJ1XSjUHgki3r21gBXomKaDfrvpEDUDIvuchljy2LsKwzkO
	ctL6oqSUGwzipRb6k7ykLWEEgXBm/IaZCqVnJdQIgatXsog74QRI+r5GZc3uSMOZHng=
X-Gm-Gg: AYBFou1plmFLujEXnsDI59ka/e5mpvvcMdVsfzg8ID+bxzA9GV9VfBGVaxrAtbKy0TW
	ovpzaYb+bglESExgibgIRP1JyrOaXPF7EhhgnKdl9o3CGgSFNuoem8pjm3t5oTI6/fUzB1fe7gZ
	+hqVk7X7OdaNJW8AAu1YZFjw0n+W7rlzuC2pB8WeQMDy5JP8V4lKwp1Dufndh6GMXDaGa8/GUfB
	31oKdJ11HunNA/ZrQsljIKI3EBNj7i7YUSVHdVHlQEvx/N/f8PHwx8KlYDZVL4gurjeAIeyun6f
	UOzc9No5uZ17caX2/kCLjP6nZ0L23VesJ6tsK4rEETe9mDWoeg9pYaW9BoLhbdMfvQIiRycZuUt
	aas0gxPMvWHAc656trRl0UplpJp6Cdp6l6vvE2coDxt6qncP3ovF0l1W0DtabEz9VIaTndBiDpL
	X5OCB64FK2PF+9z2YDUVHdQB8FJZaUEspjvsDOZqjS8ULMFYCB/bkh5Q/+FpQn2KxFtWpyUfpJE
	/U3il5A+Yb+cWuOfLW9PR6hQ5dGtVC8qBMVavM7wUf71FDOh8dCrBfYv/QubxXzIdfQE3Ui7dN5
	9KUJ3rHKUc0TtM2QcKihX9m6250Vw7962jh/Gp7zNVyFo/EaTRQ=
X-Received: by 2002:a05:600c:4e11:b0:4a0:eae0:769a with SMTP id 5b1f17b1804b1-4ac185bc7d0mr276506235e9.28.1793699648696;
        Tue, 03 Nov 2026 01:54:08 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aaa4b85fsm43219155e9.10.2026.11.03.01.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:54:08 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Igor Velkov <iav@iav.lv>
In-Reply-To: <20261006-hc4-fan-tach-v2-1-e27ad96e92a2@iav.lv>
References: <20261006-hc4-fan-tach-v2-1-e27ad96e92a2@iav.lv>
Subject: Re: [PATCH v2] arm64: dts: amlogic: meson-sm1-odroid-hc4: add the
 fan tachometer
Message-Id: <179369964799.2330120.9043967618143448654.b4-ty@b4>
Date: Tue, 03 Nov 2026 10:54:07 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_015410_535729_5607F459 
X-CRM114-Status: GOOD (  11.12  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Tue, 06 Oct 2026 19:36:17 +0300, Igor Velkov wrote:
> The fan connector routes the fan's tachometer output to GPIOX_7, but
> the fan node does not describe it. pwm-fan therefore registers no
> fan1_input, and the fan speed cannot be read.
> 
> Describe the line as the fan's interrupt, and mux the pin as a GPIO
> input without bias: R109 on the board pulls the line up to VDDAO_3V3
> (schematic rev1.0, sheet 31).
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.5/arm64-dt)

[1/1] arm64: dts: amlogic: meson-sm1-odroid-hc4: add the fan tachometer
      https://git.kernel.org/amlogic/c/81e55899e134541583a4e611ff750e1868671c67

These changes has been applied on the intermediate git tree [1].

The v7.5/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
