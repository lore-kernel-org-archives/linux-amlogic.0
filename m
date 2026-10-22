Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AC3606A326
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 15:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3P6WZLiF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BkOgLayl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qhkPJ8ry8NUVeg7pLV/3EoiD/bqLbbt5eCLYIFJvnvo=; b=3P6WZLiFwj5KSn8QEn2O0Y60Ft
	sINQSo7XKiSVwpUeGvkuLVv+IID/69WRdyhNu8JrZcB9wKm+M8yLjatmhOK1ZMeYiYsLVtbpUFAFO
	YyYe6KKWwidkFjawTBnpENJHKFSJlbwEwTBOv2mRRRAhZxc8yAFsodSpb1ZikrlFOyA1UPMnXBIGn
	vVMXHlQah/U/HmDWMH2eLrbJgd0hoZ1gJa37aKw1UyFmaQRjznCaRThvExOVwq/1alfJzTGFtaLkL
	siRdMpV+96xA7Z5eVzU7/lWfstgXQX3YVxCGldWRnXeCqyrgWkIAm0WR0trL6Hq5gFoAp3K25p//w
	m6Pz8Rmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvAf-0000000ES7x-1VWn;
	Thu, 22 Oct 2026 15:57:37 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvAd-0000000ES7P-1Puo
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 15:57:36 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so7429055e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 08:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792684653; x=1793289453; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bCyNFGNC5QAv5YoFhc+XguwmFWmtXQoZNr4gvZ9GhCA=;
        b=BkOgLaylQinH1jknPO8lE0MrQt2nB7cN0+BfWvQEK/bnn6H+SBwx25K436DWWxb5dk
         gBKnLgMEK00e+vDilXUMy2SpWDalBV17hCL8e4VhiPZTLKopmCCoqe5ZkpP+gZH7PEGu
         cPMJ4rC7FI/ptoXS2ikGzGk5n29Rs19nhKNJZD4e9UPEExisBdzEh2p2rpB3pyufE3Ex
         7EoX6V6PaEwbF6qj5FSAxIWxQATUpJw/tnZRv/8aSkuR6OqwuuLKsk4Bo9xf99qw30oL
         MM0cEhSyDB9IiKFT1iyoGvwjDVLSVwi4h0zGjO+LIYZYRWaoRcIVGCkUWeDc7UDC3y/J
         haSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792684653; x=1793289453;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bCyNFGNC5QAv5YoFhc+XguwmFWmtXQoZNr4gvZ9GhCA=;
        b=Il0gHxc1MNo6jIv3dL9mGmKg3MIFfyeBi/JjvIyiYsNdzuL8Bg1ID8F3j3aoAOzM/P
         QezpXMpQR1rtolg4F+m54fdoQcJMQmne8PQ3NncJdlIdCNaV9szRImywBg+wLWfh09FQ
         4Bx8a/eOb8qv8Iq7oTEAhIhYVEdYPvhxBjx7KbDI855zuBvMcpLnhj29wpC83eUsbwfn
         gCccPjJKc6XxceHaqw9xUdoozEXbMAnaY7+uzlj59LjUDuBsOCKJJgAXTkZOT/00HoLJ
         rAeqB2THvuD1/cfQ0ioGhMZkS1vvmDX/LHvarqetnSyLLMqPzz+cjnPyN+yqo192bpwG
         7NKA==
X-Forwarded-Encrypted: i=1; AKwUvByMpFGxm3Mr+XSveYgqBOIj9wODwRRjNIoKjwiXx9+Aa+3wbGYF2QTGlGfvk6GNAzmdyWDkj10R7pCEp24O@lists.infradead.org
X-Gm-Message-State: AFq9FYIXQwD6UgWK9WoEmOiKwoJ+nyvVC0ItAfXxPk6r2ekp8tocx0NZ
	dExTOguAH2ewbWVPHjcchs6WrbjRMqtBzWd/b9CAlI25H3bV96jHxkQcA16wP2mLudI=
X-Gm-Gg: AYBFou33nvHr3k20or2Mv1WAfwNqXmdYGSo6xeFh9cODRlA+TofbwTPE51RssSlCYEq
	/fUe5r8kDgjcVl2wgZctjjDTWnuOL7e1us8jAAK6RVuYMuOPp7C8hdSwEG0AMEMTWMI/6YaPJIQ
	qOQJypK3xjunGKfLy9GnULvkTfvaFPwosk1rC23fTdoZKp9Xltj2AYWh9pr82NBVaLJ+yQYdrBR
	xcsU7Slv+09pWCOWJ7qYtF0tP41YLIMAbZLEePqQxEAbvKjq//zBo5MK4FZdhWjAnenkswZBz3s
	H5Jni6c3wwoRaNn1mihHT3zSKA2mf8+4Z6twfd9d4+0m+ZnJeEtUC86s2zncsyvBmkBXariO7QJ
	/JS2O2gKqpIZrlvTAhNehpba1b6ZJGWc9k2umvb1DabZFdKGSKEd+tZRpHOORbKBW4Uo04Sz30y
	ISnENYFjLr3EfHUNcW+QYTLdkHEtuhPdvMu9uR1tycZg3RUSDaEtDco5ypBTbVQppFcHv2BzxKs
	TAsAmkGpfDY/xEwI4Pzdq/diFuPk3CtfO3kjJg7CrAwI/grwK8X1wzk02NlaVA3mgDkql87eVt3
	NsdnccSeQum+1FubVypxu9snVNKv
X-Received: by 2002:a05:600c:3548:b0:4a1:e774:370c with SMTP id 5b1f17b1804b1-4a1fdd145edmr114281495e9.30.1792684652964;
        Thu, 22 Oct 2026 08:57:32 -0700 (PDT)
Received: from [127.0.0.1] (mob-83-225-32-96.net.vodafone.it. [83.225.32.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd360e4sm96519725e9.4.2026.10.22.08.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:57:32 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 17:57:26 +0200
Subject: [PATCH] MAINTAINERS: cover all the headers in ARM/Amlogic Meson
 SoC CLOCK FRAMEWORK
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261022-upstream-maintainers-clk-headers-v1-1-d09dd4db01d6@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQrCMBBFr1Jm7UAz2CBeRVzEdGJHbSwzqQild
 2+qiw/vbd5fwFiFDc7NAsofMXnnKu7QQBxCvjNKXx2oJe9aIpwnK8phxDFILnWshvH1xIFDv3O
 K5P0pHV3qAtTMpJzk+7u4XP9u8+3BsexdWNcN9iE8poQAAAA=
X-Change-ID: 20261022-upstream-maintainers-clk-headers-fc2668f41f5a
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_085735_395848_869A32E8 
X-CRM114-Status: UNSURE (   9.29  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ARM/Amlogic Meson SoC CLOCK FRAMEWORK section was written when the
GXBB and Meson8 headers were the only clock headers, and only the A1
ones were added to it since. The headers of the AXG, G12A, A9, C3, S4
and T7 clock controllers in include/dt-bindings/clock/ are not covered,
so ./scripts/get_maintainer.pl does not return this section for them.

Match every amlogic,* clock header, and the axg* and g12a* ones.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..e5bda99b3015 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2555,7 +2555,9 @@ L:	linux-amlogic@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/amlogic*
 F:	drivers/clk/meson/
-F:	include/dt-bindings/clock/amlogic,a1*
+F:	include/dt-bindings/clock/amlogic,*
+F:	include/dt-bindings/clock/axg*
+F:	include/dt-bindings/clock/g12a*
 F:	include/dt-bindings/clock/gxbb*
 F:	include/dt-bindings/clock/meson*
 

---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261022-upstream-maintainers-clk-headers-fc2668f41f5a

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
