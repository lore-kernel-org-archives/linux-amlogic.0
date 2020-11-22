Return-Path: <SRS0=nfxB=E4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC19C5519F
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Nov 2020 21:59:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFBD020757
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Nov 2020 21:59:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MIBduSVO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="qnOAFZ4z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFBD020757
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pAyJBvmKitVXSxNYrDEHatKAm9Ki7KSBUQZSB16WJ5c=; b=MIBduSVO5qOdjYRlu8r9qm/w/
	0neKHKTyILu5k1j7bIbNpOBSfypws67Qc5UqoEQvN4YNBJpUaNQtZ8eVmjgjbqjF/KY7Xdr+pKV4K
	1aEzzr//moBqkpWx8X38WmLezRoR9z4cj48ZTofwea0XUsBoqdRGL5odAe94UDRqH8G8UjLySOohY
	QLWO7iyfXbOLC8HG5P+V5giIWUIj6SwMGo6TE7NsbwdoHX7PFCtqYbciPk/1/iadbHSX6gdGwmQZw
	579LRayQT/qq3DBhOFwmY3N2AvE676qgA8z8JBu6YAt1qm5GNGN2UcsoefAzZCm4s7J7CgZNE1GDO
	BxZbeCcHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgxNo-0007hu-4q; Sun, 22 Nov 2020 21:58:56 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgxNl-0007hM-Di; Sun, 22 Nov 2020 21:58:54 +0000
Received: by mail-ed1-x544.google.com with SMTP id cq7so15137235edb.4;
 Sun, 22 Nov 2020 13:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iETOeqXGmNqlviqJArheckaE1gU0xbXAL1OaafL93pE=;
 b=qnOAFZ4zDJ7HmZT+alrVLLh6n+AGbEc+kRjpKaY0bZo+a4czr333jnx4AsXgqve74O
 iV8MHAK1xo871+kwgZJEUt2Nt+uI5tXKGHwa9A3Biqt7dEvPKjOTa2Afjvk9phWeoAcb
 u6G4BhwBVxpTHaX4xSYVN0oCMEO+M43OlE1pLkeUZ6OXNV7AcDeBdcHHSU1eNzDzZXAL
 pbuzsrXlM4E8oRODhTRYDZo2y3s6kGLqMsL7RT1k5f3/QddiEjxvHLQXpvrttf83ILp3
 y3JN1nZyDBwZrqzwxw1jN3AI7utDovnkV1bBZ3Kf8cu24opoTbjF2ZrtheqNGISArc7N
 Cz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iETOeqXGmNqlviqJArheckaE1gU0xbXAL1OaafL93pE=;
 b=niej5FiUbc8Kv0Q4mFK05RBgh8CMN1NUymfxWDSuuqegrIFBBDnOt5cqYeghhed2ng
 gtshAroLx4/nhOf+UFba2weW1+Z98urCxRnl2p2XMLfP7+5IoQ9dWLU4kkP6Fo1uphZo
 VeXt29+jHtDL1HE1svenLzQ1grbBSmUkLBCFROzbIN0VhRBIB/jwKy/ewXeDGis7YvLq
 hqGp3/1sD/rd4e5utSsD8N9xWcDBG56Nsh4sIqYF0oKFBoC7TneMS+kt5BRw45vtnt9Z
 9vsjVa6SS8jhoAtTc5GbTJuXJilgQxEZmUqrh66Ehp49NxdStky90j48uzrFbORnPmRS
 CRSw==
X-Gm-Message-State: AOAM533IylKrWZvb2k7FqfNShaqivBnqCuijJ2kXwNhQmTbUAB22eM7K
 kqDLAELIpyd5qWkQKRrtYHY4uOBdz97jpCkMVJXogPPVH/g=
X-Google-Smtp-Source: ABdhPJx8AHTu+8lRjvvsDw1xPAePlr/xWSlw6xqBpALbAeJCssskj+x4w0zb+ZnzJzf2rh+Z8GUYTzUFpgIzLzCg1Ew=
X-Received: by 2002:aa7:c889:: with SMTP id p9mr43326461eds.110.1606082332064; 
 Sun, 22 Nov 2020 13:58:52 -0800 (PST)
MIME-Version: 1.0
References: <20201120152131.3918814-1-narmstrong@baylibre.com>
 <20201120152131.3918814-2-narmstrong@baylibre.com>
In-Reply-To: <20201120152131.3918814-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 22 Nov 2020 22:58:41 +0100
Message-ID: <CAFBinCDSQdKqYBzBTH4GYeUCtChycvALK8X3XHf44qQp=Ed31A@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: meson-axg: add PWRC node
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201122_165853_472002_847660A9 
X-CRM114-Status: UNSURE (   7.59  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Nov 20, 2020 at 4:22 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This adds the power controller PWRC node and the corresponding ethernet power domain.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
