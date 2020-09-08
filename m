Return-Path: <SRS0=WuYP=CR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D906FC43461
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 08:35:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BF8C215A4
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 08:35:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IYAhGAXO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=alarsen.net header.i=@alarsen.net header.b="kMpihx1M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BF8C215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=alarsen.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Hbko9umUkxyZDRLApwM5+dAGnm0vMHpXZPx7GojmOMM=; b=IYAhGAXOx1T09CRalG0PshpKF
	ljFR6zZBUAglbtY70k5xDsNM3BH+0/qa1j+yEd7UUUyUi2TTssubWRzoMDkihB/wGjb5KvHIecVSI
	Qxx5IzAVOeKnPO/duZrTA6PsgF1lUVaxvlw8gi+xA42vJwzPayDKU5i4rU+fqgtPDccPpcP+/UGSW
	tSJ4YnvWnGddG3xoSJWi7Kvs/Ve2FylvsfIwG3Q10O53Tn5fXGdtJQ/3aeQnvkvappPXjjkDVZnek
	DoqlE9JvU39tVyHw9Rlb0A5vGoBA573WEqhpmhSqKowuVlHRjoQtwOw1C4bT+5V9lOrg6mr8y3eBD
	0DyoBjs2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFZ63-0007OY-0v; Tue, 08 Sep 2020 08:35:23 +0000
Received: from mail.alarsen.net ([144.76.18.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFZ60-0007Nu-Is
 for linux-amlogic@lists.infradead.org; Tue, 08 Sep 2020 08:35:21 +0000
Received: from oscar.alarsen.net (unknown
 [IPv6:2001:470:1f0b:246:b440:f8d3:1c0c:d20c])
 by joe.alarsen.net (Postfix) with ESMTPS id C72DC2B80B87;
 Tue,  8 Sep 2020 10:28:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alarsen.net; s=joe;
 t=1599553730; bh=vAMC3BpR+mvYVqZXlzgmRJWrQUKXzqY7hp9gqzLPC+M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kMpihx1Mn0lZF+E26HcrGXm3wEl1wM3kQy9vMh0OgkdaWmym0/RAttcriMqnUNx+Q
 onTCxRAk4kQFdU4k5nSd+5wUEG3XWrGMOplq2HqO9QooG+jtDochhQkAddnZU6i3BM
 A7l1QtSqSgTV0VKpPpD0wi38Cf+6S8QGZy0DmSts=
Received: from oscar.localnet (localhost [IPv6:::1])
 by oscar.alarsen.net (Postfix) with ESMTP id 98F8327C02A7;
 Tue,  8 Sep 2020 10:28:50 +0200 (CEST)
From: Anders Larsen <al@alarsen.net>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add Shanghai Top
 Display Optolelectronics vendor prefix
Date: Tue, 08 Sep 2020 10:28:50 +0200
Message-ID: <14178277.p4ol7qMFiq@alarsen.net>
In-Reply-To: <20200908075421.17344-2-narmstrong@baylibre.com>
References: <20200908075421.17344-1-narmstrong@baylibre.com>
 <20200908075421.17344-2-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_043520_851066_143CDB48 
X-CRM114-Status: GOOD (  13.00  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 linux-amlogic@lists.infradead.org, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tuesday, 2020-09-08 09:54 Neil Armstrong wrote:
> Shanghai Top Display Optolelectronics Co., Ltd  is a display manufacturer
> from Shanghai.
> Web site of the company: http://www.shtdo.com/
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index a1e4356cf522..4e9dfb352c68 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1078,6 +1078,8 @@ patternProperties:
>      description: TPK U.S.A. LLC
>    "^tplink,.*":
>      description: TP-LINK Technologies Co., Ltd.
> +  "^tdo,.*":
> +    description: Shangai Top Display Optoelectronics Co., Ltd

Please keep the list sorted alphabetically as requested in line 25 of the file.

>    "^tpo,.*":
>      description: TPO
>    "^tq,.*":

Cheers
Anders



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
