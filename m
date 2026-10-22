Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392E4606A319
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 18:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yFUkhSm1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HmWT3PeY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UdFkwc/tCjc+zKq10nF5TI91vllQnodZBWiP2Kh2vUk=; b=yFUkhSm16WZkVG13gVWMVN78r6
	X+84uHPWSMln/rzb4vL6YHkClpvdtH69NQU4OWUH0Hj1oBLMc56crKiYB/4c4EHgiZWnUTFvBszzc
	VG/D5wrW3WyaGeEamoOADbVGlg19VlJOEkfMjRgnrnKmRwI4DcpdcB82TfTz0fitqIUAn8All6J/u
	8AGVZvJfgQS8HxOXT0apLDpSuc5RuzqkKQTkkGL7yByFsUREYfzmleDZq+EOFfudiXf6LfHco5Bwz
	YS3pUWlyzHCkny1hg9OFHBs3Zdil1ygm7X6UwtmGnDmOz44GZNd3/0FOe3UNAm6aM37vpeM/dYIJ7
	djta8hhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxQN-0000000EhMj-2izN;
	Thu, 22 Oct 2026 18:21:59 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxQK-0000000EhMM-1TXN
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 18:21:58 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48e20edd106so83090f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 11:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792693314; x=1793298114; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bQE0lagaKaRPxOL0ymbiA3jEEX5u6DV2i4c9cRwYEcE=;
        b=HmWT3PeYHPMc4aWcaPDhKIVE9s/sANwN3UDgOR+ccEDgu0fVLeX2Tc0Lq0JJ1mocRO
         4jq+OE6/vUDEk4J42ivIYClvUCM1Zybr/l3QtE310WPYWec0XDDbmpJqDcf/NFWpMJnD
         bfWmkoP9NhKM3PL0xbsL/Neyn0kgJzGYOHgUBkK6GZKDnLgPsckxGdAwPF/ilm51K+TC
         l914KcBiHy6hg1IiysVKdypGROUuZgY5VnHeY7xhYDzuYfVIs7zrF67YI5+iJB/88Chk
         sQNyhLFAj7w7HGeCnXOzrlmp89Lx1jR6D+l+z/jOkVMY5kSju2I2bowWzpe5L4bglVxl
         L6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693314; x=1793298114;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bQE0lagaKaRPxOL0ymbiA3jEEX5u6DV2i4c9cRwYEcE=;
        b=c38qFy8eROYBVGpwkfi95PgWbb5OSezHF8Z651xhy6HRi60i282AIB27MS+9H1bD1s
         hpbqeR9rGsWX6TaOeBdGEj2MrdxtM5th2UImoFQiX1v8ZYobmtaNRpttJaD4AFxxhtHe
         GkQzPeWyQnjTe0+HQoU5IxA5Qv+4dgXR3BnzDFfUubzHcQyuQzmJIVW+FfrzZinL3sNx
         hqZ7ieB4XtQqmqZpHlh/tWR+MS/FxT/Y/XpOyLeRJbgUABj+TvQPfuiOXVgYdosGDBE0
         OCxk1XVp7jciGdczepO/2P0cCA9xaPYTdqCU1wCxv7g+HoTkaI1qzhNF0jCheUvSZSFH
         O7yg==
X-Forwarded-Encrypted: i=1; AKwUvByB4FRRP+n5eVtguBubXn0sqvFfSkJOu6xAQMfD1jzZP4O832bjD3/5vIhsW8wWjtohcLS3GXI8G5KLDh6W@lists.infradead.org
X-Gm-Message-State: AFq9FYKEkjA+eViZrhCs2Tg0ete9WU58jp0rk4HiETgVHTIe2lFQIslJ
	xF8YsA+7nLIAY1/3Ff/Nbd3Ymbf4naeqxdjQdi36wZ0gl3iWp4xMoxDWMEBFUP5zQkWZ/FIXqo+
	BowJa8NE=
X-Gm-Gg: AYBFou1WBzTotweMezBJRZpS2AucLOE3atBNdPIyv9OTJX6mcT80VdG7JB5B3EEToBI
	Njwk5v9Iqds6VT5MYWdlrrytrW56HsXTRxWiAUtRyjaKObfAjeJYErB5YIjHl6IrihCtNYMuPMA
	pjLkXPkZpHz8bK3H+HmrEgdBVUdFMXRX7mFruPyVsar/AuSptH8y4zdBsmo0yK0/xlIYAQyfXMn
	gnsUOAYK4Qphu9uyYB+xmyCXfgqCjqF0bE4dWhZ2QxwxcN/ZprsWls8Nh6aM7DVltVFmVPIB8yN
	WkZ0WEOHSm76BZScOsi0Ax66de3DdlB1ii/fG/a9AHT9lAOEGk+Bqn7awEJTeIq/f5FTpAFLONf
	sUMuYrk127Y69HMPwy8fkb6YB3DDTBfRgY+Mj/fxTmeXvO0hHPBid+a5e81+LhRRkqfv7SzqIYV
	Nwv9mwe8FYeTk85UfaqkEj5MTmEOY+VW23itXhKvsErR36YB3jjlxYaSYxzP6e7ppMMhGoqKk1k
	FHBucfxii+Ctg1Ogv6vnhwOAT3QfHLILmLqiuwjN0MH4kQfVXE577wLw6xGK7V2kYHxz8l35Ho=
X-Received: by 2002:a05:6000:401f:b0:48b:68:594a with SMTP id ffacd0b85a97d-48e264a328dmr12950455f8f.12.1792693313834;
        Thu, 22 Oct 2026 11:21:53 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e379cf680sm10654f8f.20.2026.10.22.11.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:21:53 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] MAINTAINERS: cover all the headers in ARM/Amlogic
 Meson SoC CLOCK FRAMEWORK
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261022-upstream-maintainers-clk-headers-v1-1-d09dd4db01d6@baylibre.com>
References: <20261022-upstream-maintainers-clk-headers-v1-1-d09dd4db01d6@baylibre.com>
Date: Thu, 22 Oct 2026 20:21:46 +0200
Message-Id: <179269330668.4070168.14282043797701140302.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=600; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=FHA0UZKs4ozL3194RgoWCh9aYKr2i6a1lCUCq4oBDkE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFm3QhzWOBQZXriX7Ht+SVZ0w74cw10ndyeHsz2zKu5as
 fFW9O60jlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAExkyx5GhgWGYu7+x3JF1PfO
 /nCPJ0JCaSGTRt3uzHnByRxfJx05fYnhf0xUcsuTE1qzk6PWPpon7p79Z+avy3UzZyx/+/djhVH
 0ESYA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_112156_404972_B512EB46 
X-CRM114-Status: UNSURE (   7.28  )
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

On Thu, 22 Oct 2026 17:57:26 +0200, Carlo Caione <ccaione@baylibre.com> wrote:
> The ARM/Amlogic Meson SoC CLOCK FRAMEWORK section was written when the
> GXBB and Meson8 headers were the only clock headers, and only the A1
> ones were added to it since. The headers of the AXG, G12A, A9, C3, S4
> and T7 clock controllers in include/dt-bindings/clock/ are not covered,
> so ./scripts/get_maintainer.pl does not return this section for them.
> 
> Match every amlogic,* clock header, and the axg* and g12a* ones.
> 
> [...]

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
