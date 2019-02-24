Return-Path: <SRS0=HZJY=Q7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DEA2C43381
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Feb 2019 20:55:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B9ED2084D
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Feb 2019 20:55:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IfQV4KKq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="iBOAoXyA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B9ED2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sF7IcaJVJfCCYYOYqQsn+L0jJ/JFl4U7lW+mdV8mjQw=; b=IfQV4KKqYVSayg
	hUJUs5IKK8jaauw4pLokcyrR4zDtHPzENtHs0Vy+c6daNhR+oA18zETskhVuQBDkmWzqtVbuoXu2V
	//vau9BIY0aCFHTOgXqJbwRlbkG9zbesjhf/GR2a2dSSzLk5xt5kxGGCcB6b/X6+QX7kHwlutn9ja
	65QFvOffWnymn+Jy6IIHV9Gv1+TH8ru+/2cQweUp6+l0M3aUbljmOl0dv6ArgmzNhfe6SyfYrNtmo
	xmefyEe0z3Tt3LzzHGDgPHbTuomJF2CbrDlLzsoBrbVhfwPLX5Elrxq4Jx+HXvBYYZH0oZDl/dxRR
	7uDPfTzaFG3/u9GZPLIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gy0o1-0005RS-3t; Sun, 24 Feb 2019 20:55:25 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gy0nx-0005Qs-Nx
 for linux-amlogic@lists.infradead.org; Sun, 24 Feb 2019 20:55:23 +0000
Received: by mail-oi1-x244.google.com with SMTP id i8so5687948oib.10
 for <linux-amlogic@lists.infradead.org>; Sun, 24 Feb 2019 12:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=UozOplMmnDJneblNWxQUlcMo9BzB8ViLCFWJl7WUPNA=;
 b=iBOAoXyApS2aBrcsljdYsUhjFe64iZI/eIuCbOnUjL68htXEFigzvasFsYhSqQphXV
 /L0ePVefhFHDUf6ksL03uwjP/+e6VUo+AbVX+Kvwh+k2qBOpywDAvQ+2IaxXTrjqfcjw
 83ZI7IKsWQfolWd7wajsfIvdd6LxQTKXxbOmU4ldtZyrsPWNBfsqw9ZcSZ7hsfc46T4c
 vJPWvCioppVSXnufIl22SeaZDRnLu0thLWcEN7B6zw5JzJ0DfqGMYdWMhNskhKljQnkP
 RwS10cYFIGhK+UgSnrkF5MAunS4OfIQSm+QjS//z7YxZb4cTVYSla6IuFtB9Y3S3z8LR
 3HqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=UozOplMmnDJneblNWxQUlcMo9BzB8ViLCFWJl7WUPNA=;
 b=s3dBNxs7G/v7IqNQc7XTGcsw3D8UeohkZ85GumZKWDvREpj2MQpqHgdyLCzBnljgSn
 NOvildm7WqMgSCEmV9j8uZPSI6FouWxe4olDipUBxcQs9B1HuR+uoiqxpi5N+g/IgM5s
 tRr7+jsxtW2X9wZ5qj/0/roVpVduJ+uXdOkv9mi8MV39loUOXS7lLGbf5FQxQLBTd8Cm
 QGtlZ5/1vMjbQnk32LFPJTk78sa8VyD2RCLCtMWybBSXBuFGDMaIKBDfAE4Pqk9Q8nNq
 uWuQUzTt3If8ZQMi8h7OJKknIrY5zB4axYBzewnTAfeYgzUA2Q8RrMqIKbNF3bYxXD4L
 f04g==
X-Gm-Message-State: AHQUAuZtZoH3e0gK4KHvPhcu0cPKSo483rnNQPbQA/eOhiJJk8AzycdD
 MB5to2VGpPLjzdEtk8mzqTH4vJEo0ZjpxoV26WkLocAN
X-Google-Smtp-Source: AHgI3IbOAVI3kLqUiP/odyDCz8ua+MxtIL9rAZ7COlaRObbMZuPX2BG9eK20Fs2QdyDwZYBqCRyw39cOQVlUt26lJ9U=
X-Received: by 2002:aca:bc0b:: with SMTP id m11mr8829310oif.41.1551041719901; 
 Sun, 24 Feb 2019 12:55:19 -0800 (PST)
MIME-Version: 1.0
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 24 Feb 2019 21:55:09 +0100
Message-ID: <CAFBinCDRKJS-RXgVBDo2gjp_bU8Wmbhr+HGXNad4vCFyrvN_HA@mail.gmail.com>
Subject: 32-bit Amlogic SoCs: avoid using Ethernet MAC addresses
To: linux.amoon@gmail.com, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190224_125521_807128_3D9E7F08 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: netdev@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

I have seen Anand's your question in [0]:
> only issue is I have is the each time their is random MAC address so I
> get new IP from dhcp server.
> How can I avoid this. I have tried to enable eFuse driver but with no success.

u-boot on the 64-bit SoCs can read the MAC address from the eFuse and
pass it (via the .dtb) to the kernel.
This requires an ethernet0 alias in the mainline .dts though, see [1]
for and example.

I'm not sure if this also works with the older u-boot on the 32-bit SoCs.
if it doesn't then there's a nvmem-cells binding for all Ethernet
controllers: [2] (please note that the function implementing this
binding was recently renamed: [3])
as far as I can tell the stmmac driver doesn't support the nvmem-cells
based binding yet

Anand, if you want to work on this: feel free to do so!
I have the SDHC MMC driver and a discussion about the power-domain
drivers on my TODO-list, so I'm pretty busy at the moment.


Regards
Martin


[0] http://lists.infradead.org/pipermail/linux-amlogic/2019-February/010464.html
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f7c36209c46c4d162202b65eed2e66962ad8c3c1
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9217e566bdee4583d0a9ea4879c8f5e004886eac
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=afa64a72b862a7a9d04f8d07fba632eaf06b23f8

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
