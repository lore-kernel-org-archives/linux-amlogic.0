Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FED9C0015E
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Aug 2023 03:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h/kEqgwVbyHGLSPFKRSJHVJmrAGKayJ3imTN5c8jspQ=; b=nLidh78ngijW4t
	QCNF7MZpWz1zh53a0G5VGNjmU8QbT0VCTWLcq1aX0a+9vUwutiNn+nPGNPyEUagGxNqrzH13SGkpX
	F93GwLMKR1+y5Kc+0ddreSipmN9KEgxxlrHo36zw7NHpH+tRoicBJyeqXh2B9Gf6LNskRRfKcLzLK
	2JupZGxHFlX87OFES9oQsYsEYlWE+gGuR5smoxJQGEp79DsOxS6iUdq1r6nQhVQaa9Gd8DhVOzDa0
	T3+JZDglB4znhv6bQBcycFEb11gIB/pd3JiwDuR38muWga+1zS0widfxll9ry6NUpUiR4BKOLVCN/
	KAS3v4v+/9bLEbCOVm2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRlAP-00BQzG-0B;
	Fri, 04 Aug 2023 03:07:53 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRlAM-00BQyE-0l
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Aug 2023 03:07:52 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fe2503e3easo2683961e87.2
        for <linux-amlogic@lists.infradead.org>; Thu, 03 Aug 2023 20:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1691118466; x=1691723266;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d8AfrAY2ZGogCZnT9pjHagxUiEJXfq8HDQdgAefjNa0=;
        b=YGRo1eUfG9G7kRGOEjZ+7NoTA4rrjEDVVR+TetxIZiZZa5VsGyi9CTmIW93z7HHM2Q
         MEcDwbZ3EIdulRzTK9HB5kFoqsnvo6Q28KCv+pFiWzzFAS8oyC5/Fz9Pq5fwPy1bXM6O
         Sbakd4AHZxedXK7An7OslMvpfKEBcQxeaxTmuzvet/FZN5r8RhYMfju6SrEbC3/NweIF
         CG5vbsquWWnEdg3TMFM6PuMz83aHQGe9H9RJyTlbjrxV7tk14odjWDTtHk+/R5gNSTlK
         q8noRZF4JU6i2c4jot2r5L4JmUDNwRjKh3o/bx+I3z5g1uAtbcdfyE7OxzAftgA/WKJH
         4SGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691118466; x=1691723266;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d8AfrAY2ZGogCZnT9pjHagxUiEJXfq8HDQdgAefjNa0=;
        b=bXbDibjA7/SOZiaSdDa+xd3o0wd9z5NUzGGXR1WtqMN68iplKkc2eiVWq5THwPXUDc
         bMFMtozvlVCOJ7cDL8oMj+m5pWfvMVbvaSn0UzDa2Anpqh7HLXlsCdKule8Uq3SJH1Xw
         CTIJQhPxagyJbmE6EOuX/mRVp6FU6aCZL0Ets6isGSp7R1Cs8uEDCFykobASA14qEGac
         B2xC4cbD3fkm5mSgslz+zMWRYf3YBYpm/e2j1GF2aVoKvEE5ncJlvdmS7CECcTugxRAN
         b36+9I3BT6SZANeOPWmPY6/RRureH8mmp9orwpQIyrvXoyTcf2x/WEoRUawPR8lQ/axc
         Ysmg==
X-Gm-Message-State: AOJu0Yz4AZ9DnmGTSEzCGfCVnYlVHFgQMCBJhGiGe0uWqcO/v9uIQT+Q
	2fBbeuYeCJZ++dzVmXK7RA6FQXjYzMbeveO8P4NH
X-Google-Smtp-Source: AGHT+IEqNunxQUqBpOT9oFHZJRvMLIfY+kP6NYcf4dY3x9ci1li3qv1UVhkhpZD5GfPLyxsn6u1BdIqwlGVGGd2bug8=
X-Received: by 2002:ac2:4242:0:b0:4f8:5d0f:c779 with SMTP id
 m2-20020ac24242000000b004f85d0fc779mr285207lfl.40.1691118466227; Thu, 03 Aug
 2023 20:07:46 -0700 (PDT)
MIME-Version: 1.0
From: Da Xue <da@libre.computer>
Date: Thu, 3 Aug 2023 23:07:34 -0400
Message-ID: <CACqvRUZRyXTVQyy9bUviQZ+_moLQBjPc6nin_NQC+CJ37yNnLw@mail.gmail.com>
Subject: [PATCH] net: phy: meson-gxl: implement meson_gxl_phy_resume()
To: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_200750_750554_4F6AD205 
X-CRM114-Status: GOOD (  11.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

After suspend and resume, the meson GXL internal PHY config needs to
be initialized again or the carrier cannot be found.

Signed-off-by: Luke Lu <luke.lu@libre.computer>
Reviewed-by: Da Xue <da@libre.computer>

---
 drivers/net/phy/meson-gxl.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
index bb9b33b6b..c4a07e6f7 100644
--- a/drivers/net/phy/meson-gxl.c
+++ b/drivers/net/phy/meson-gxl.c
@@ -132,6 +132,18 @@ static int meson_gxl_config_init(struct phy_device *phydev)
  return 0;
 }

+static int meson_gxl_phy_resume(struct phy_device *phydev)
+{
+ int ret;
+
+ phy_clear_bits(phydev, MII_BMCR, BMCR_PDOWN);
+ ret = meson_gxl_config_init(phydev);
+ if (ret)
+ return ret;
+
+ return 0;
+}
+
 /* This function is provided to cope with the possible failures of this phy
  * during aneg process. When aneg fails, the PHY reports that aneg is done
  * but the value found in MII_LPA is wrong:
@@ -196,7 +208,7 @@ static struct phy_driver meson_gxl_phy[] = {
  .config_intr = smsc_phy_config_intr,
  .handle_interrupt = smsc_phy_handle_interrupt,
  .suspend        = genphy_suspend,
- .resume         = genphy_resume,
+ .resume         = meson_gxl_phy_resume,
  .read_mmd = genphy_read_mmd_unsupported,
  .write_mmd = genphy_write_mmd_unsupported,
  }, {
--
2.39.2

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
