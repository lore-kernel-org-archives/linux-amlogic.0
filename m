Return-Path: <SRS0=aHVS=3F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654AFC33CAF
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 23:50:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34C4A2064C
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 23:50:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lb89NQKh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="NO65U4KU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34C4A2064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1tHJ6SnRy9A0mxcWNHuzp7fEc3mrBNbJ6Rvy6VtEc5A=; b=lb89NQKhXmWIq6
	i5T4HZNcEdjhQWqQCxbRIkhuW8A+wKPXl+iFI/cdvYxSyLE8SHqLWQNO8CnADiM2R/aPyV1IwcYNF
	7m1Lij+Xna1JfJn93MpPlFoLlOa7cBozZgYgaHlX5NQJsV1SnbeszqVnyWTKJPxmyPTofHvutwZxZ
	BjMbvq6SKHiVP7a8DMY5uIn8IZXJM7+zAIjWLG3IFcgGiV88+ofN2tOq5kUfqwaLnvDMk6o3F6OoP
	Vj1MnHJDVLEnfa0Rkfz6fFh/Q0dZELywQwKhg6PJi5PqFNSPxnXvNtIRYgipLledE/eGlUiVLsv/c
	2AMyFPmT1PIUwI9j0+NA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isEuG-0004nb-QJ; Thu, 16 Jan 2020 23:50:32 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isEuE-0004mP-2B
 for linux-amlogic@lists.infradead.org; Thu, 16 Jan 2020 23:50:32 +0000
Received: by mail-lj1-x242.google.com with SMTP id j1so24510708lja.2
 for <linux-amlogic@lists.infradead.org>; Thu, 16 Jan 2020 15:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dvzepc7K8px28OiUWR54vWmKoJmOCY0jRRsL0K691xs=;
 b=NO65U4KUg+ApWFvDEyU2TkPyEgh/A+8RBC/MtJ5mh/hiz/dPERHbkSKJ8hL/qoTjEm
 PSx5ZboNDA37TGTUDlnfgU1zDBZv6BbBg1GKsQ9rq0hxb8Yh1imUbF6Yz/LX0AGlltjU
 dkHw71kAgpfMreX6Fqd9TXxOFCq1wh2djE5QVpgan5ym6jBrLmdrn5duJ/McS23vuP2W
 dMou4jKeWtvATCBrPeONpm56EXyL/PxwIdVAXB16ISSZT6pd0NNoCwn5QJmGpPVMGroN
 nAiELUKmUjwuFlvJChwCWoXJ3ha9TcVbcaU18a6JorcmUoEVJdqDuVqoh+e+/IX/X6zt
 /FoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dvzepc7K8px28OiUWR54vWmKoJmOCY0jRRsL0K691xs=;
 b=nmEmpVbIX3JqALDRHRZfzGFcuUR7ZeoXNLyR4otyq0BRqe7PJyJJjbCZDE19CtuUQg
 lofC3Z8A6oeha0cmZ4j1YDsKKLzSEuJN3pOvF6PBWlApI5oYlSzpygZ07HPfh/h8dMeI
 /H0o6XmQssAgDI33Sto7CLiQywnQ+/MpfJ15eKieZUQKhS9198Rd0gJa9aKgD1kmL/cI
 06tWdiT7+XAMq2SAnO2i8tej4JR4FyLS4ACVaVgWkqXksI1KCjOFosz5F1LOuVQBDUlM
 bL2H76T9PeDGQoNf5KKrfrDt56vNLAtPlDXhE+RJC/6zQwgP832sjfYJJGcIPjmX219w
 w5EQ==
X-Gm-Message-State: APjAAAUUEGzQ9vqy2Veodvm4/3VgQAZ4Toqy5UWrtwnxw0VO2w82/0LO
 aMIAiJn+FHrfot7MlBGonUaq3Q==
X-Google-Smtp-Source: APXvYqwcly4QWy35BIk3rzRP8EQq3fbvuZTQK86R2RMoNH+mB7rBo1ZXIZWjKO9DrXeVOm+4AkRR5g==
X-Received: by 2002:a2e:98c6:: with SMTP id s6mr3709037ljj.14.1579218627864;
 Thu, 16 Jan 2020 15:50:27 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id r15sm11438831ljh.11.2020.01.16.15.50.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 16 Jan 2020 15:50:26 -0800 (PST)
Date: Thu, 16 Jan 2020 15:47:23 -0800
From: Olof Johansson <olof@lixom.net>
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] arm64: dts: Amlogic updates for v5.5
Message-ID: <20200116234723.3kmdg43joouuwr7c@localhost>
References: <7hwo9udi7m.fsf@baylibre.com>
 <CAOi56cWPvOhnWqtLJXQimRLpMrt_09oNz4HTmqr6-uZ0Bz+A9A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOi56cWPvOhnWqtLJXQimRLpMrt_09oNz4HTmqr6-uZ0Bz+A9A@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_155030_923330_9D969FDC 
X-CRM114-Status: UNSURE (   9.26  )
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
Cc: linux-amlogic <linux-amlogic@lists.infradead.org>,
 SoC Team <soc@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Jan 13, 2020 at 04:00:29PM -0800, Kevin Hilman wrote:
> On Mon, Jan 13, 2020 at 3:55 PM Kevin Hilman <khilman@baylibre.com> wrote:
> >
> > Hi Arnd, Olof,
> >
> > Here's a round of 32-bit DT updates for Amlogic SoCs for v5.5.
> 
> Ugh, this should be v5.6, and the subject is wrong too.  But the rest
> of the pull request below, including the tag, is correct.  Let me know
> if you prefer a re-spin.

Heh, no worries. Merged.


-Olof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
