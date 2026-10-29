Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBB5606A31C
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2026 14:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gddtTiG4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ewjAmSoD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3de8Nd2/j8VuPGN6GXQpQDJviRLR50bFCYv8+MsNIfw=; b=gddtTiG4D9ium3neDJymqcrmtZ
	dX6VBNFb6mCiAVqOwuMk+xlfUdTvU9kHMiD8HLHBXgbIq18zYWAgFXkyIbdJ8kG+pz6D9smXdvxtc
	DDE8XMhuQgbt6+FM9/7gUuyA5beNplW9rDwyWS+/bAAPjThWkuAUHAJiJYA5oBjmdsKCXMxWLxTVA
	X6OMiVKvxDeoQSU6NVzsZ2jLPMZUGtXdZ6XbFReV/bRb9N4o8TC9n52+7b0uV+vQyZjxjrkyFoGHs
	phoWBlTZ6CaZlX77KFxRdgaTm6anyJdTFEZ1uCMeDiLbAp4nwTk5C6drLrepMnHQ6hQCdx227+2mJ
	OVA9pZzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMREx-00000009XJg-0rxD;
	Thu, 29 Oct 2026 14:36:27 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMREt-00000009XIV-2njq
	for linux-amlogic@lists.infradead.org;
	Thu, 29 Oct 2026 14:36:25 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so17608265e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 29 Oct 2026 07:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793284581; x=1793889381; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AobNRzoJo9ZhKbhwLMRuTuaSxhba9zwPGclaewwNK7o=;
        b=ewjAmSoDLf9udMTcld3MYtODJrLZRDaQZZlcLnKpmyRB0h7VRuyj5gU70krmUpEM/f
         ZyZKouyGgKlGd38TbT3ezEP5mUi9yTc7BTTw2yqp3KInTPDljsfJkZ2ZqZ8i60u48prb
         1hA2xxeN6dEf0PFLfY7ckL9PmWfi+JYwys0a3JprTTbx7sN2PnC2omHzeIrteRAXVaUn
         DZVB/qA32xfufKGXcUMzrc6FHWPtBejrLBldMyWBSV7KYYcfVvNa6EPDSTyb7jp+IxMV
         rhO4Q3JEphqzwSvdCBHiPL68TsLd9KRsNmYDTlERAytTv3tWFCUUVyHgE9C7UhjjTzqE
         mCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284581; x=1793889381;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AobNRzoJo9ZhKbhwLMRuTuaSxhba9zwPGclaewwNK7o=;
        b=yLVVWxfB41i6+03LuG3/9z7A/vIVByGDDZlnGzK2BEsACOlPxcbnutdcdY+aH8bkcV
         8SW2dggVko6RDXQtzoTjmEhlHxQO4/tkhBQTvbOYwvIVG3/G7PjzG0vppjiV86T28qvF
         5KhcQC17We+/TfE+zBBzl6FBEVcLgkPGj0yJQFYtMB9FqlQsS589JRG90dGGfnbV6/yW
         7TomC6hIkNqrJocxBO5R1WkBycaeQ8DY9fFsKvEeZ1fflcvn4mBVKlPaIf4OL1yKzOlq
         l6HSbV7FByiC+xT5QxgygQs0YrMVf1EXUviHPHKhhks6MsXePFA6gyx/YEqMe2M+5uGp
         wWmw==
X-Forwarded-Encrypted: i=1; AKwUvBySoI0ww3a5BQK5oqRp4lsLZRe7+VrXwxkKkXdfxqt/D8FlS5iNMT2xJwnrJKFqJ489bJ1fsFbQZHbHc2JL@lists.infradead.org
X-Gm-Message-State: AFq9FYKKLvVFUTdW5lAEqr5TmGEOJiiYdW4ozPQ1TOGDASbfyoEZs/Fc
	pOfpMAxvY/QYnOUvKo55uyIeVtYGxY7APssLGtIbFp9PpAyrajwPSwv+P3iR8ldyxJJkqNVBKvj
	IlS813nU=
X-Gm-Gg: AYBFou2Jl0P7n2ccmHY0xfmVJ0Kx6LStjmAe0SQQvlZnHU8mWRAcy2X100s6PlT8tT3
	3BF4OsXaEAqQLUXWLNb4ugHa9NMPDvDIJzSlOKZsJL4OD8TqnQZ+vtw6i61IvfyZJAqyl7O3ByC
	opLIYLi0xLvFrpf2jEgNMFbcFJC8VFX1WZ22AqX9qC0YtfuYGTU7t/Bjkm8jaPkh/nk2qHYvjl5
	XSYVb4jTW/CMt3z4GmKt0KZCgfdcc60MDxJNTcSlYKmVrYo9OYUCghhSvlQl8tjZFVYlkLgPY8J
	suEgdNKb8TqGov+OH5dV/H1Ow9ZIbsuaj5uVpPhTyu0FZeNybcvY6rp5rNrrX0xzdChL3TH5YVi
	8+aplv2+an9c5iMm/djJivURv/XDSjI5vwug+xRgJAXTZmIkwnvefM+3+CSD8L8wVpPJuHFY3Sm
	MrZWV73XYpjZaiaFwq04krHPLi3HK+cvGgQOZJMCsWmabZnXYK5+VEVkCB8/z7lTXxdGoav+XEU
	GqWgMKUNd/Umvz3pN42r5mbQoddbfncxrT4urENgVkKlInmwg3cb6dpZDueZFMfTfR959FFAZpG
	iplDJNQSUuBXO5u+1zGqMn2le4Jd/vk70JgqDESW6Mcwawle
X-Received: by 2002:a05:600c:6085:b0:4a1:e01e:1927 with SMTP id 5b1f17b1804b1-4a996a9e304mr115101135e9.5.1793284581222;
        Thu, 29 Oct 2026 07:36:21 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a96a32eef4sm80612955e9.3.2026.10.29.07.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:36:20 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] Fix the ENCP clock select field on GXBB, G12A and
 S4
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
References: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
Date: Thu, 29 Oct 2026 15:36:17 +0100
Message-Id: <179328457778.1865333.17367903644168961694.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=328; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=I6EvPRMH0NyoJrkviiRd+YwWhq7FQ66k6ghPBYl+JiM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFmPIx8LPbxyy0ci6kzfIiapRZva5gtGLNK0DJVjmvol9
 kQC74+rHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZiIghojw5bD68TulT3j+8wp
 V/biuueWSxOFT7/cVbHvs/upiYzn51cwMjyJdD/z4eTLD9z51W7b7z/cIHlEU6d+n8HFS+1bvD4
 wSfEBAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_073623_716903_937720A4 
X-CRM114-Status: UNSURE (   7.64  )
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

> The GXBB, G12A and S4 clock drivers describe the ENCP clock select with
> the field of the ENCT one, VID_CLK_DIV[23:20], instead of [27:24]. Fix
> it in the three drivers.

The commit description of patch 3 apparently does not really make sense
in the context of the S4

A part from this, it looks good

-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
