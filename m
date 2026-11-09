Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398BE606EE81
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Nov 2026 15:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UQepP4Ae;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=gi3uQdRS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o5H1LKsl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AOm8h/+AlTkRuT/FeBQ8iX+2ZWyeM5O/iRPYoyhEkR4=; b=UQepP4Ae3ilV1CSeOoUsw1Q+1k
	mEu/j79rAcFRQnljlnQiwW20pZP1x6trBiBfq62sqx4JDVTytDFHU//1a4HOzC/VxCsU3ju71vATo
	4JcRKqFAqpL0D4hM650OowVJsBgkIhOXEchtObgvkwltZfQxUNwKSFFgQVDTTlBJ2phchzqbyLrba
	q/52tEXwrjbTlXHZAhMJD1gWw+NicTi74rb/wQGvryMAQvLy7QqXTHyZ9zz9VULaffkkGS1Eezt44
	v0888LU2f5lRDsDK8Ol4YnhqU0UrVeHGJd8j+5dkx6vM5Cs8LeOb5GMzaUb6GMfXXnqVdCcVvMipH
	vwGhGAZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRVM-000000013HH-3vzi;
	Mon, 09 Nov 2026 15:41:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRVE-000000013AG-23t4
	for linux-amlogic@bombadil.infradead.org;
	Mon, 09 Nov 2026 15:41:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OxUvJu3JfSMq3bHVs2CGVC07cR612RqD3otgVjEHieU=; b=gi3uQdRS6QHcKrSCR1x1T1vA1G
	lDkGVQfsVDD67UuycyWBN4AfEn1/JCtaRVveCMSEcqzoxJ3Mbzslmm/biSZrRwkHaEXZG9UEwXiOk
	+n4S2stPrNocWL5v4ZPVZKD4EWaejQAJ5yfwBcA9MI6i+2OEe2W9Aof/E95kKnnSgUQLXBuZYs2EK
	6l5W7lOTkd25NIBjs1KV7aeqdzkuPPjPqlybrhJqW3vthH1ucqH0MwLdTLBw5RhjCcc/9R5V3D9a5
	selaLG+0ETryrn9MBJmqIQgPnda66SbFhw0x0tw0EGnzgqnPkibRoexdbGb4NLUdKjyHyIhV+aRDh
	hkdMS9kw==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRVA-00000006tR6-0mpj
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Nov 2026 15:41:45 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so9289165e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Nov 2026 07:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238902; x=1794843702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OxUvJu3JfSMq3bHVs2CGVC07cR612RqD3otgVjEHieU=;
        b=o5H1LKslJMdNi5aZBEEU1jnMBEUEpa3t37RCpQIvVucNmRbp2jLkzN/2hYq277ziNx
         YifgvnWZ4B5x1Fb6OUM6gsmrzqtCTjearyQsnh1jQ3Uymh9ySRavIVKKrwdJjnjSzpos
         4XbLvBVvDI/cKhYrdxeH8kPYzp8/ZUhPqtOygbAIhYheOHs3fsy0FTPz1bIKMfg2MXj9
         xAEyPd3XZFziRh0EAOxzZTx6VvMkQs5opcZH5T8Eqlc4N6ibbVc6IE53vn55kenUuWxB
         tqvv1R5PH6bavaCDl23N3svxtlkQ4noa4NWFqnrmHZVaMhDaFkL6ifZdUUdV/W5TYTF2
         0/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238902; x=1794843702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OxUvJu3JfSMq3bHVs2CGVC07cR612RqD3otgVjEHieU=;
        b=iynUym7vmVfzmFkAvLT2vX75CndqR6Ri/oInaWdDQmcMrl8u/3sCQIVkSU0Xmjtspw
         vHGue4bvkpfbuHOrK5Kzvs+8+tMKnXP8isIbTu2GTltZzxIoG1K0xV1KCIT1smqnFaBD
         vxlRlO084CQ8iru7mKJDuCRl1hAy1APj2ySH0+Y70LvpOCZJ+fnugew2P3FF2ZYK7HoE
         pmn7UTrxr9blVtQiDfIZ8VZ/Ix/KSSBnIiLCkeFnOkLeY3BsHTrkRs/mxJy3VFY6Jxhy
         x3OFpSgV3AHaJjqx5Bxnpn3R1pWxiBtltzmA2iQvUtDjEkFZBj6gOkO2gLBr8jUyGvXx
         5gsw==
X-Forwarded-Encrypted: i=1; AL+hErFbiuJAab/r3VO6tqNTsaVpwrg2hp4BnZ2cHWnBik5S60weB5IFA1Tq/xPu+5rSp6frG+YledWt3XAPiNMh@lists.infradead.org
X-Gm-Message-State: APuU4Z++c24+0P1xdwnAXAuUlfj1agGnguZZeBZr4TLb8cVLllPHqVa2
	aLzHxzIdE1IgvrDw9sHgerdYbcdcHD8bBYtDSnOjiPcY0e8yFmvIZTxW
X-Gm-Gg: AYBFou12DN5q2IopwS29tRajMRn8iMSUyOZ9bkJSX5pcI2XNkSp882mGVVqFt2tBfn9
	NaaOrQgKMxA+qWfrh6XuJQO21KNE15kgZa46OZI03E05FV/aEEKh5h97YdDdezzHZpnJK75Fmdk
	B83cPY0us/1UxDATd/xkWprQt5c11TV9m1FUinW6Ehr2C4awwF20TwvX33N2TsRKSPNiWqnsdpN
	OU8E/PIKWs8GG3cr+tR2lwfkIEmHm+1zLHsPOaR7m+ph1WUA1t57NoDC7/TESKF8a1wjpOUv92g
	eZpbUcajhLoDxxSr53eIGyQvL0R+AtIss5KH7KjkqDxIphSX/bNOVe+dOQRTd80J8GpJTbtRHH3
	rKcGEqgHfQ1vtsw9p1YfL0hWFxVLehNocvURKQhOpF0T3szTF1A6BGoS+zko6bkUqGMr8s1OwRQ
	lMj+Dqrx1p4WwTJahJXymwAfJDRQncapDUnPSkaJ978zyV61a4eV/TKPZNfayxUKK01Q56lsNeB
	pzL22RShwmiL423SpfAIywH9BlE5fshBbuRdEXCC8t8PhrAqYAXz7S5H1+fWZo3kZm2ik1m2ifT
	TrDjBJpDYM3hbZi/sN9LvyquEaWx+S8Ou9JPRlxdOFxBperGtkLcItRm8aiC/qoh3UdOKIGO7X8
	kow==
X-Received: by 2002:a05:600c:34cc:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4b963c6ca22mr78879565e9.18.1794238901583;
        Mon, 09 Nov 2026 07:41:41 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm561650375e9.3.2026.11.09.07.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:41:41 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: jbrunet@baylibre.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>,
	Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH v2 3/4] ASoC: meson: axg-spdifin: select REGMAP_MMIO
Date: Mon,  9 Nov 2026 16:41:19 +0100
Message-ID: <20261109154120.592392-4-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109154120.592392-1-jude.gyimah87@gmail.com>
References: <20261109154120.592392-1-jude.gyimah87@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_154144_311274_FE09E530 
X-CRM114-Status: GOOD (  12.03  )
X-Spam-Score: 0.1 (/)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

axg-spdifin calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  axg-spdifin.c:(.text+0x154): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_MESON_AXG_SPDIFIN unselectable.

Reproduced on v7.3, arm64, with CONFIG_SND_MESON_AXG_SPDIFIN=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 5ce5658375e6 ("ASoC: meson: add axg spdif input")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 4b06a9e7c72a..10c7d59a5ad1 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -85,6 +85,7 @@ config SND_MESON_AXG_SPDIFOUT
 
 config SND_MESON_AXG_SPDIFIN
 	tristate "Amlogic AXG SPDIF Input Support"
+	select REGMAP_MMIO
 	imply SND_SOC_SPDIF
 	help
 	  Select Y or M to add support for SPDIF input embedded
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
