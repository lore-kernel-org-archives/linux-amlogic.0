Return-Path: <SRS0=x2rd=6D=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA4BC38A30
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Apr 2020 16:59:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 686B5212CC
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Apr 2020 16:59:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lxcZCjWP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="GSVsDoWN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 686B5212CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cyyqQeWrMR9WTtirXxueMgHbgVfcK5Fz2g6BD+A1yow=; b=lxcZCjWP4nWvXN
	dI+Rlsuq0OBhCUfxbBt2OywGVn6mzb05oAfEEloW7IiT1UIfnSvW2PfLRlOJhwuM3PdHIWmzaQy16
	bKgMg6SzTLM/FASHz/oArCJ10/YvGYjlLq0tX1qB6dd7Gj4TSEJXnRw4xHV2Z8PREO4XEsJ6Ixozi
	NATIfxqpKlMdSHphJ32r3KTltRDkw7flOKqteyIQlqHgUJaqlqXteDfju2FN33Uzd26Ks5pvjh85w
	GsgoHGZelZxjroxgY1K2DF0l3S8OJHDuT0kfWZ2JcX3pP43SsQDFgYUspEOMurbPjQw38kFCV5JgM
	ILlfFi1XzDaSAyjEcjdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQDHl-0004iP-Gn; Sun, 19 Apr 2020 16:59:13 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQDHd-0004bR-MG; Sun, 19 Apr 2020 16:59:06 +0000
Received: by mail-ej1-x641.google.com with SMTP id gr25so5886421ejb.10;
 Sun, 19 Apr 2020 09:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yaz56HMp/S89gaKfJpEhbFFnazFPo/RmIrwLmVduCoI=;
 b=GSVsDoWNqHMk1a/muWiXRDv5VANp+vqo4c08fPkDbG9pNXGJRYCfhBZv19nTVghEV/
 rR1emnmvALzm3mBWNYCb0tCXhj/GfMY3BYzeoBauJhrrRlhcvWODFDzalNcgQiZnlPhB
 ZDPKvd6TuNENzsUlt/+aJ2D4KeYw7DbL1Xu9ryn67NfucngIFG5j7z0q7ocNEJzbJmUx
 SRU25/mNFOHWOVjhmQajYOOgAngNAQCBuYtLc56flZ0Z6Bgu4BqB/z/zgXf0Kl/Ks4k6
 ymF3jNCnP0eu5hL1crG77BCfqeE3R/o0nZR2x4u83cHj1p0GHFmOpVOfyN+/sztPbXWj
 vM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yaz56HMp/S89gaKfJpEhbFFnazFPo/RmIrwLmVduCoI=;
 b=jcbZVYxj3keKBRLXyk9c6bGXk68dPuLNpai4is2FYNk5BaE6J8dt8MWRpDyvAKUhHW
 CAZbfXLx6yXziozuBKS83tNrdwN2nfeNw7TSJYR4ontTy6CLzoBzd7ZaVej3Lf7uAlt2
 hUcIVUFhBx5cKb2NijZFkpqg3IR628lFNfFcG8t/kb6uRrDEMtujfqT05ccZ2JGwNt0x
 n5AlhKq2Tl2IjsLyXQlN4PCmxZ627uqRj1hnVqWT5X1zgnIrp4Qut4z8yfwmYNp8zugG
 XLC9l5gQIGUZPURA8OONId/kplpmRWYq5uPnTJmmNfZ9hF9GpdjWEZS/f5rDTYc49rCt
 +HYg==
X-Gm-Message-State: AGi0PuaLeN1uz7c3L/tLQ4xAMJUCY5tGevE0xKx64ULW03e5XMtKZVbZ
 5MZylIi77wWP/pJ/HeTlWAE3aEj4y1ckbqEJTZtNUQ9y0dgz0g==
X-Google-Smtp-Source: APiQypInUWs4bxD4QvtZtJ/yVZmP+/efzMlqnIUknrqdkFj4i6HrJej16oCfUeGD8zDR58ToIyQMVGpbDdwIYRbGjLs=
X-Received: by 2002:a17:906:4048:: with SMTP id
 y8mr12436425ejj.258.1587315543506; 
 Sun, 19 Apr 2020 09:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200418181457.3193175-1-maz@kernel.org>
In-Reply-To: <20200418181457.3193175-1-maz@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 19 Apr 2020 18:58:52 +0200
Message-ID: <CAFBinCDOw07_MHa=EBiLZsw24z3x5ngcW8_xmN6fJ8SqPmyyqg@mail.gmail.com>
Subject: Re: [PATCH] net: stmmac: dwmac-meson8b: Add missing boundary to RGMII
 TX clock array
To: Marc Zyngier <maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200419_095905_726401_64AE0B2B 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org,
 stable@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Marc,

On Sat, Apr 18, 2020 at 8:15 PM Marc Zyngier <maz@kernel.org> wrote:
[...]
> Digging into this indeed shows that the clock divider array is
> lacking a final fence, and that the clock subsystems goes in the
> weeds. Oh well.
>
> Let's add the empty structure that indicates the end of the array.
oh. Thank you for fixing this!

> Fixes: bd6f48546b9c ("net: stmmac: dwmac-meson8b: Fix the RGMII TX delay on Meson8b/8m2 SoCs")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
