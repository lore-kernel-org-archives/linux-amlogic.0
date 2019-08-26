Return-Path: <SRS0=Ixac=WW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11FF9C3A59F
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Aug 2019 12:13:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D38352186A
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Aug 2019 12:13:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ST6LLw2a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nXGicwi8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D38352186A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PJD+1ToeCAhbwLIbADJAup/vljuX1yuguDJonQgtce4=; b=ST6LLw2a7JOFdr
	1mkLK+6RSMpdhWATMf79g3N8C4hqncn2kzbK/zFyAuJ4kieDiBAkphiMyYYTvJbB4Z2U3C4Scf9++
	heSL9mtxmQorqc3nxwm0hanHBGX3647qhApBua68pDgAiJqH4zccOG0SIfH7cSq/8ZfXqqj4bv82a
	JSOBTSR1iPed0tt5Z4NKcgNjPo9wSd6+dR106VjPmWPUmRS0glTq59vz9zNnCwKiFGaeWI8cjL+c6
	yIPWlTZvxDngDDrlN5yOAfeM1/Vs/ZkHWbOd3U6ZsXyHExkM9ZHTCZ0VEaeWPghKtWMYYy3UK2yXf
	EYU74GtBiS69EqiMqSzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2DsG-0000P3-WC; Mon, 26 Aug 2019 12:13:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2DqP-0006Yy-5q; Mon, 26 Aug 2019 12:11:34 +0000
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9619621883;
 Mon, 26 Aug 2019 12:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566821492;
 bh=YjOhHVNb3S+TKmqIRau91HDeiF/9aMDjoGnlxjpwtFI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nXGicwi8LQMcrqtLzIDuXd2LskmnWsntr0uvzQtncJ+uBbM8dsai6PA6n9rZG3gIj
 a3B0I+mcQe2sdxhq3J11jzfVQZaccPj66WqPYLJBGrBvvKUac/qJCUXOYaTVoqz/Qx
 BWxu6sEVnIUFWYZiVrbCphZdvtqiIA96t3Gn3OUI=
Received: by mail-qk1-f172.google.com with SMTP id g17so13755903qkk.8;
 Mon, 26 Aug 2019 05:11:32 -0700 (PDT)
X-Gm-Message-State: APjAAAVPa/0+rzMPR+gNE31fycwzhMVt2fYKZNkoHnAAekkVr13QD8pd
 R8crRsi+Uy+4dshMx/qEUAcHxZ2TusjxciKovw==
X-Google-Smtp-Source: APXvYqxagKO99F9mS7t6DaXXxukZkMZEy/9XN2GKqINovi5R7IFk0Zl3h+jg5Zq3YC4qsFWsngg9N8DwLKv0FhuW7S8=
X-Received: by 2002:a37:4941:: with SMTP id w62mr14601999qka.119.1566821491710; 
 Mon, 26 Aug 2019 05:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <1566633850-9421-1-git-send-email-christianshewitt@gmail.com>
 <1566633850-9421-3-git-send-email-christianshewitt@gmail.com>
In-Reply-To: <1566633850-9421-3-git-send-email-christianshewitt@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 26 Aug 2019 07:11:15 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKJvyYpAb2n1aq7RRKrgnt+oL2yd47b4jh=QiZdu6t39A@mail.gmail.com>
Message-ID: <CAL_JsqKJvyYpAb2n1aq7RRKrgnt+oL2yd47b4jh=QiZdu6t39A@mail.gmail.com>
Subject: Re: [PATCH v2,2/3] dt-bindings: arm: amlogic: Add support for the
 Ugoos AM6
To: Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_051133_373146_5C9E0B8E 
X-CRM114-Status: GOOD (  10.68  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Oleg Ivanov <balbes-150@yandex.ru>, Kevin Hilman <khilman@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-amlogic@lists.infradead.org,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Aug 24, 2019 at 3:05 AM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> The Ugoos AM6 is based on the Amlogic W400 (G12B) reference design using the
> S922X chipset.
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
