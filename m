Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64269606A31D
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2026 12:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oKFbU7ia;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lsdqO7RQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cVsGizX7vl83BuLy985dEPHC8dWWSmfmuPxA+7nuTdQ=; b=oKFbU7iaC+JYixnNDeBqnCf/1E
	ePvda85XLWj1zyy5B98XEVJftN9rrIbfU9DQ+se5bYClrB0WpLEoEXPnn1hdY2BhThYeecnzSyxc1
	EgAyxWpgIuuvrgcdQ9MqB0Vn4vWcK8H1zDlV5PCTsTsqvxqXLhKiLo6d7WBIAsi/fuCNVoNdqB4Z+
	S54WpfS+WA3k9OL+qENSwIB+x5Cd4oB9YKNddafUE3S18Kuubu2NIWAs7u9Y2IaQMML7BCDLEPHYl
	bu6YV1LdxdHs4JLzS6cR9vsw8uIXlrvW4jSCZ3kn2AS7zlAFS1g3wCGlVWJPJaYB1cASixCuQFtY3
	ZkTkRILA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPeV-00000009FYV-0KWg;
	Thu, 29 Oct 2026 12:54:43 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPeJ-00000009FQ5-1DeP
	for linux-amlogic@lists.infradead.org;
	Thu, 29 Oct 2026 12:54:35 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48bbb06e746so963762f8f.3
        for <linux-amlogic@lists.infradead.org>; Thu, 29 Oct 2026 05:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793278469; x=1793883269; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCZa7OrCfiqCW2NQ+HdDQnKwWKIbdOgXD9yC1aIimaI=;
        b=lsdqO7RQsu/tLTBbCl7cYPpWb1buQhjbROld6vBJbJ8Qel2sR5XO/DlK/Hv9pDKF8y
         Xp00BnPqJX5d4Qth7evrf0w0mRhB76NLYZOmHJj06wTqVWYgtDa8PtkqjNDYk3oXYUF6
         nifKQbfb6cWPxFXNFje8irSJ2WXM/agOhYyObV3qbtQw7i8CpToLmlN05U6jFIoc7Rwy
         EhsJ25+yPCzSw0i+ns64D8rsKiL4WL9Yi/sAP7HSwojte1D5qyZCAnTK9KNTTzwFNJ4r
         S68YPxhJIPIXk+mC+XFzKn/JwJWB6B/jG8768u7CUrLJ37Pcrc45LYxdeEndxmgglbAw
         0vqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278469; x=1793883269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YCZa7OrCfiqCW2NQ+HdDQnKwWKIbdOgXD9yC1aIimaI=;
        b=BiIf6mt3vMrHMPocmIm+lTP0CfAdpANv8BHvcJ3mSU6Y9FFA/DN8FlRFLD8Ug7bM4t
         tfqgAu983sODRd9DjWsWvPmPaGrY4Rv2IqF441d/pRh+cI81KY0PwqiSPiyMgHVJ0daU
         0xdVLufR/odunKBa8skVB5Vrft/I3fsayrOlcY+g8e1QblFoHv1LMDsFhTr3nUT5s4RH
         zKUZE7OLeNyMwnQFpm0rwVb0VRUEsQ75zIbZvuBlDMM1P2kunq9bD9XLGmnT/lTkBfQN
         vmnyChD+GDZnKKYR5IywZYrpLZ6Z7Ym00gNWKzOlNjWOaXulVtzF9dsmIOR3XtnWm6R6
         sm/w==
X-Gm-Message-State: AFq9FYKJBp265s4VfOIqRvT+vCcf/5LAxcAIghEZAcKVkqKVJVtgIqfZ
	pslSLN+V5/0aytAUHV9yPO4uUh/CEKwDytEjr/3tAC/gt+IALANwWK0PpZkA1aVL+l0=
X-Gm-Gg: AYBFou24LAOqzVPcR/fj5igRDy75bah1wpX1VlxjJtONMP6OsoD1hCqL1SrzgjdC893
	eV52Jaq9Iye43ntiUNT1oXhpVNXbFtzIBU/ebZtk5NEgrz13VImJV2LkOw3uSVWJvFP84gO4iMx
	qunJMzfgmC7HDnZ8GvI0ChX7nRomflTQi5I1WFjHE2fWt/aDSS1hzKC/4KxdO2fhK13gfa9JpSr
	whTEhhugVVmKFq+KpRLkxH+wB2Gz2JjXYcSHtos+FBESPLrpYd7ReSSXEOmfuc3JxKp29LJkqOx
	Wlud+EBTsLRBBlDiOhIJ8ze7CSrSpH7Nco3MfUC2uWQvpY0HjNHlUJoAmzv7FfV1M7ho7xVxBhp
	ttIws7JeQxcE11fvhtvjOt2nEmddxUF5S4XGyeDspYXlg+a4T51jdXs4hnK7p0H1YfXdlNhYKkP
	kVU5m+snXldUepcEY6NawCoPqHnzjbvOw44ctyp6uJrpexacSqQwMgtc+rX70n+Fp2aZdGlq89X
	iiMxQmsf7uN+HVXGNbExgESp0oEizvjK7fa2UK1pyONvTK/sA/HEyRdsqzTr+Zpghp3fvzSG/A+
	R6Phhs4qhrBo1Gm0pHwBNF9tkwQIZ/9Wvh0MmmiYuKsEiNJBaN2V7R9kD6tF1l0vG/EjJ8+1qOv
	LqIyxDLbrhappkbtX0XxK++VSNudUhkbAb/ciQj9Wi8V8AZc=
X-Received: by 2002:a05:6000:607:b0:48d:f034:7fcd with SMTP id ffacd0b85a97d-48e5d5d1486mr12914361f8f.51.1793278468880;
        Thu, 29 Oct 2026 05:54:28 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39a8sm35034622f8f.11.2026.10.29.05.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 05:54:28 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 29 Oct 2026 13:54:20 +0100
Subject: [PATCH v2 2/3] clk: meson: g12a: add the missing HDMI divider /4
 alias
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-upstream-clk-regmap-ro-divider-v2-2-7a375fd8f88e@baylibre.com>
References: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
In-Reply-To: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_055431_341491_0F8C59B3 
X-CRM114-Status: GOOD (  12.48  )
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

On G12A, HDMI PLL divider values 2 and 3 both select /4, but only value 2
is listed in the table. Reading value 3 therefore gives an unknown
divisor and an incorrect clock rate.

Add value 3 to the table. This also avoids a division by zero when the
read-only rate-rounding helper uses the value read from hardware.

Fixes: 7aa6c24697ef ("clk: meson: g12a: Limit the HDMI PLL OD to /4")
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/g12a.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index d0d4c7b6dc82..b23b9514fa91 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -779,12 +779,13 @@ static struct clk_regmap g12a_hdmi_pll_dco = {
 
 /*
  * G12/SM1 hdmi OD dividers are POWER_OF_TWO dividers but limited to /4.
- * A divider value of 3 should map to /8 but instead map /4 so ignore it.
+ * Divider values 2 and 3 both select /4.
  */
 static const struct clk_div_table g12a_hdmi_pll_od_div_table[] = {
 	{ .val = 0, .div = 1 },
 	{ .val = 1, .div = 2 },
 	{ .val = 2, .div = 4 },
+	{ .val = 3, .div = 4 },
 	{ /* sentinel */ }
 };
 

-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
