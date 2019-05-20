Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D58BC04E87
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 19:19:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CB8D206B6
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 19:19:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uqSufObm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="IRgkt9b9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CB8D206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XE4l8DLTXeqw5OY324kRbW+BLn99qU8RDikfI8C38Hc=; b=uqSufObm18h1QY
	C5+tJChKGMGK5OT/8DL3ojq+441NT45Eje+hSbt42rI5ydcLcxkXyPCy9ywGR/iODBgCnHO78c599
	qmOzs8O6Jz8vuMa4A1B5HIgPhf2soEm3QK+RPCLjit41A6o3DLFShQn3Pxpk49DUPm80y3synE5fO
	N0ETC8RIhCsuFfUKBKknTpaMqtMyjRbzjWAezUOqm4fZqD1DI5hauLMFLaeo2FpPR4XmyXZ/GcEnC
	RddleoGw+Yi5MyadwMOFfCdAs2jRM/RmmaXbMNxvY43lFw8vY+1wZMgir5/0QRgXHYSXXzrl8+7g8
	keS+P/B8uI61wOLyGLhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSnoX-0000cb-Jd; Mon, 20 May 2019 19:19:13 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSnoQ-0000W7-Qy; Mon, 20 May 2019 19:19:08 +0000
Received: by mail-ot1-x343.google.com with SMTP id s19so14059930otq.5;
 Mon, 20 May 2019 12:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ILhuswdCRnMUMBRmoi3Za/asPHf+23D/dshJBOh3X34=;
 b=IRgkt9b9zjWY7xSWKf3ivsymx+TC/KfBZhHDWrkSWQqWt6cYLLu0r0mMd+cd1BFYUz
 cK3qTiWLGAVnFU035zQqlNUcbIC17/XLJbfFmd74MeixlEr0o9e3+PtNAAqkTVN7zf2o
 LeX6rTJy6W4L/MtBXIU5piiG5DlQKQnwFsRmpq96AC3IXTiqCTT5EEmqUNMDc7ON2FY2
 tg8M4yNg4Z22Na3rD4AB3Ji5+OWe/fXvUxsy6HQ189KOgw6it7Zdiy7wFbDwJAow9sTk
 NJ/2Czl6OhEa9KaxX5Wd9IWIQaeBy2w5I/VoAChefH6yUqlSfD4Yn2pn4wNHKuo9fkDX
 WCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ILhuswdCRnMUMBRmoi3Za/asPHf+23D/dshJBOh3X34=;
 b=duOAjIT2z/siBt63CCWahFqNBm75fkZRfWYpegBB4Nh3r6+MN3XZGmKj2xKsZnDGWJ
 zGsVtiBPTlr/KjTWhvUsvXzrqyGBP/4bZ4pKY4mlfNKI5lDXGd2g8avheA/96GS5bWpd
 PB9CwbTUhVtZpF9vESnFAzw4OG5eHeDpy1q1fKpe2MvNFfU1iaQGte3M1eUpwdx5y4Jx
 AAH1un1X47qHx5WMPjI8Iq58cTNGmV01kGkSU3zWKf1pm9OH+hK2es1QlAD1oO0L+G7I
 8m10REXnS9VOihHT3iCdIiiSec4Tr6t6z4QE/Jz5wfPQ8Lq3fVV6cnyoG6uPJNqBPf0p
 W2ZQ==
X-Gm-Message-State: APjAAAXkdhou9jHgJNIE5DbUJEIB11mUeeTLz6w0lI1/Yo/1A7OnzQu5
 MWUsDVfF9CE0ikpXdQ5Oz4oxQbFDraz0RheXBZw=
X-Google-Smtp-Source: APXvYqxOKdOcy+woeXdOWs7xjYQizw+lQeSDcB2n1Zo2IaRnDlaZSguwn9t7esINb/joJB11sVjoVDP/NqKnjOr2KuM=
X-Received: by 2002:a9d:744d:: with SMTP id p13mr26102765otk.96.1558379940532; 
 Mon, 20 May 2019 12:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190520140421.30074-1-narmstrong@baylibre.com>
In-Reply-To: <20190520140421.30074-1-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 May 2019 21:18:49 +0200
Message-ID: <CAFBinCBi_tSMMq9sUuGeTU8-KWDWczwJ=utAv4oARVTNgiDUJw@mail.gmail.com>
Subject: Re: [PATCH] pwm: pwm-meson: update with SPDX Licence identifier
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_121906_870471_BDDB6199 
X-CRM114-Status: UNSURE (   5.94  )
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
Cc: linux-pwm@vger.kernel.org, thierry.reding@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 20, 2019 at 4:04 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
