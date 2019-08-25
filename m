Return-Path: <SRS0=OcNe=WV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56842C3A5A1
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Aug 2019 20:00:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 230992082F
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Aug 2019 20:00:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mlK0Fur9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="AsbeQfzz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 230992082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PxPiVu+aTjaenaUKBF+WRNsx0SbY+IwJ3QJi5YkRBBc=; b=mlK0Fur9gzK8sA
	cSuR24jplDQPpzwSPCZ9ZXJJ3j1Usb2WRlcMPRnGebpuyB+1fIopt2hL5Ln9/bIcSuIO8b3Bey/du
	zKLJmuUZKVxgx9oDcFG5klqFIKZmr07il1YOrBaRDImhRqf7D1F7c8mKf4qd+TWjJkVqTQFk72Il+
	vvTPYQ4iwVJQQKTiZH5CgwBQsGRBb4t+x4Tbp/6Ibc0LXcX61haG2pcwrzmZpWESIdxTiEs7Xyr9H
	/Us4yHTcjnDOBGsNa2nESYHVHo2bmEfNEizsgcPdjJv4R6XlS6YrGyFdyn0JDZAdGZ75EavZwGHcq
	mi4ItHDKgdgxnb8fC3rw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1yh3-0001lc-Fi; Sun, 25 Aug 2019 20:00:53 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1yh1-0001lB-G7; Sun, 25 Aug 2019 20:00:52 +0000
Received: by mail-ot1-x342.google.com with SMTP id z17so13268426otk.13;
 Sun, 25 Aug 2019 13:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2BnqxOLA8r90y97Lp5feVAq8KO0vU53UAi87Q9EqgQA=;
 b=AsbeQfzzSIJo+vyXHZwV6YfVP6kZ4Kohm8HBci2wkuTRoFc8tq+Yh3uXGgGe3Bc6N/
 iJBherhwguu9LRd+ii94Iv6OG6fOSiE4V8msy7Wt23zzpNw5A3khVtR9FioVtJMNg3+j
 bX2/S+Y9InIe1yICt5ARAoiTDiyiQLFIPSLJeBNfF5LeRMMvoZTjT5FdT0sgFhxdI0eZ
 zyGXLU9ZNMWDuZ+MuYAp8IYKfyIrCOHGkwf6k4VpV3WPAxyN+GcdSsGxAv1w6SvOB8MK
 btkLfJ75gpD+uABJUlo9Ma0PF2vVEWTfehO8O0TcB7QkRI03fAQO45tqsgEdcYrNFVTH
 p96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2BnqxOLA8r90y97Lp5feVAq8KO0vU53UAi87Q9EqgQA=;
 b=CeJAiTKPZHKaOjfU8XYLwhyMaAwylNBiu/Pj7HkMwRnAbNheDeyO7V7al5BesqlAE/
 2g1Rt5Fc7ZACOLQpCZ1ZlAkvzkg+4bgYVrysh4Zgzeerl5FnkiYbCKmj+Zi8n1Sq2QBx
 ZFYIf78HVKYY2IBlTrUYY0ASD3qwz1WmCrzD+z+1FOEG0xbvsu6S6aynblRm38NZYWoq
 jnmyCvrRDVLxenTax3dXwqZN3cFSd8bqgGLLCtBJlO+k3ZK/+VqcHHlrRxaEJbqYfeJg
 pjX9jb3Eziqp0mj+Hd74f21N9yOvp4ZFyHdBoxJS4OX4ZDwYaRCqiNvqIIbV0EdqkzdK
 n56A==
X-Gm-Message-State: APjAAAXJl9JttuMZh+624UmFL5WwHHTUtD8+tyFj4/hyeBHGNLh66usw
 kercJjOlo3bwwBm6scOUqHeQnIYvqoTbkCcYs9U=
X-Google-Smtp-Source: APXvYqyqDo8QI0aN4J75YWtE2lRXHhmIJArBPeiCvJHlr70ZxYAwAzvjeKsx3hcpNPj91nj2cogn9EDf0qfX7vzAkP0=
X-Received: by 2002:a9d:6c0e:: with SMTP id f14mr8712052otq.6.1566763250104;
 Sun, 25 Aug 2019 13:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190823090418.17148-1-narmstrong@baylibre.com>
 <20190823090418.17148-5-narmstrong@baylibre.com>
In-Reply-To: <20190823090418.17148-5-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 25 Aug 2019 22:00:39 +0200
Message-ID: <CAFBinCBypL5D0Rs09V5xZBrV+Spnz-9H8WnFq+0KoLZbtEprfg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: meson-sm1-sei610: add HDMI display
 support
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_130051_538534_1A3F1FCD 
X-CRM114-Status: UNSURE (   6.88  )
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
Cc: ulf.hansson@linaro.org, linux-pm@vger.kernel.org, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Aug 23, 2019 at 11:06 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add the HDMI support nodes for the Amlogic SM1 Based SEI610 Board.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
this looks sane so feel free to add my:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
