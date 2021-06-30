Return-Path: <SRS0=U8YT=LY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D81C11F65
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Jun 2021 18:39:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFF9A61420
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Jun 2021 18:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFF9A61420
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E25e5cxfRDZ2qBaOaYOXKUV+xa8BM/W1whKSRID3T0s=; b=RlSL2jdQao48JL
	3WO+8MERHWDemUx+R0UvTvPIjqtKvKxDjItiJxo/KJb5AEUxHyctE+9afFH94fu0QH+IxLdUA+LuS
	suPNYPI0MsilQEvN2UBr9JkyNARKXRDov8gHd8EynNukvP4wPma32sIyL+ans9pWft5BGWx2crC59
	8IdrLDIDOomI8HNHHvhcN+G7UJOrUe27XhPupPl7hikxTfQL0gQakdVzjH5dVPwvPYeCaCVcg08cH
	0td2PW9SrpA0wNHAvL9cXbMIvQhNahehNbJSp7wxzcleI2anhgalw3lP6G3Zk3Jsf8hjgVGsI8dEg
	n6dakmwKzh15+1F+aHWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyf7D-00F0kd-Ai; Wed, 30 Jun 2021 18:39:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyf7A-00F0ju-KJ; Wed, 30 Jun 2021 18:39:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC98F61419;
 Wed, 30 Jun 2021 18:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625078351;
 bh=ZfJAuekNP3FT8Toh4W8fRrjT1OZV0Yxwl7l8MeBHaiE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=m6Eqz7nGvioL4VtIVTS7PU3drh15Jujss2c2UVnjSPJB3YULypHLfCQX3iCi5z6MJ
 7dpGpU1yyrJlv2hDR9xIkPe3yy5GrPe8xQXC/MkIFkvyb/Qr7seRLRt8nSzWBHpkzS
 ddr54f3nsuK23mOnfG4X1CnMUpGSGyEloME0C9VWlPHBI8vxWDT//kNE37oYZcE5pS
 UHc0XfIbRxW7Ux14ln7u8B8vG+hgH4vwG9FXs/0s2eF374wKs2I7UgUpLKGcw4ihnR
 11JdrVEfMW7gqEHKavh7NzhtktRHhoPA4fDsLQAPLB1R6ma/VK1ZMSZuyb1cCRb3in
 2h04hae3VxSVw==
MIME-Version: 1.0
In-Reply-To: <20210627223959.188139-2-martin.blumenstingl@googlemail.com>
References: <20210627223959.188139-1-martin.blumenstingl@googlemail.com>
 <20210627223959.188139-2-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 1/3] clk: divider: Add re-usable determine_rate
 implementations
From: Stephen Boyd <sboyd@kernel.org>
Cc: narmstrong@baylibre.com, jbrunet@baylibre.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, mturquette@baylibre.com
Date: Wed, 30 Jun 2021 11:39:10 -0700
Message-ID: <162507835057.3331010.8069847562722001420@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_113912_722553_C5D6018B 
X-CRM114-Status: UNSURE (   7.43  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Martin Blumenstingl (2021-06-27 15:39:57)
> These are useful when running on 32-bit systems to increase the upper
> supported frequency limit. clk_ops.round_rate returns a signed long
> which limits the maximum rate on 32-bit systems to 2^31 (or approx.
> 2.14GHz). clk_ops.determine_rate internally uses an unsigned long so
> the maximum rate on 32-bit systems is 2^32 or approx. 4.29GHz.
> 
> To avoid code-duplication switch over divider_{ro_,}round_rate_parent
> to use the new divider_{ro_,}determine_rate functions.
> 
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---

Applied to clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
