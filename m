Return-Path: <SRS0=WrmZ=KN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4D3C433ED
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 20:17:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF77D610E9
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 20:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF77D610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=67DTHyCNeVUPxsFKHBYMsybAfSzDkuTh5KGkZp+0XQQ=; b=m3vhX4S+OlO8VT6TKdWqfi/l6
	cj3/+f7ptQDi67uB+PhLQu6J2SNS8bMjms0pYmUfaIqzsXEezI1iEoU6SrbCYJeoRbnZ5FThO8Z5f
	XWBZKVVulURfnu5E0bteOPSYlloVBpvDpLXjLLuIjBAbzAMu0dCUwJePNz+kQxxYV8Tybrm7ynrWa
	QR8X/ZNVAbU/su0cc2QR+cClcb3yce5mxduPdI81iT9XP238CeQPX8djVrO7PcZPZbt6gvxIbRfoE
	KpUXa/p02T8kbwuNjCJ66WcYTqrHvEe4xaXWVQG9ljO4GCNSV7LDIosFSi1D5CdoojpOJ/EH9/33G
	7l8cn2mxQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lj69z-001o5U-TQ; Tue, 18 May 2021 20:17:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj69r-001o5C-Fu; Tue, 18 May 2021 20:17:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=u3J8CL4Kku/3J5MKdzSmZWuexbF26F3wECGjeGWRhKg=; b=dbyl7ltsspDUogNWusA7OHX2oM
 wFMkpRO18yi/xbrifEjf3iNuFfA5yt+mYpJ7DziUqmLoCoBP1GMCYU69ibV+jxmyxHoTvb46edU7V
 b7I2Q4XYDqG/fLIPSCy4Kx2SvDIf6wJPxA88SR2XoM/AZ6Eco79UfX58vLAda98cmlWJBBA+oJvN2
 hRHbJDsKjzwJwbNnf6sYARRi4DvnDXQSy+Cz7Eqt5tm4vBmRrwhDTU+FXK9rIcSGHmWm/oFyp5tMj
 TKUrX7+9Oe4NsioE/ucAfIehos0AkeoVdtVf6thLL9hSAUUDiofVrt9oo4j0KBRqIMcfKmBU1GxoE
 3lch/dXg==;
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj69p-00EwQI-0T; Tue, 18 May 2021 20:17:38 +0000
Received: by mail-ej1-x636.google.com with SMTP id c20so16589589ejm.3;
 Tue, 18 May 2021 13:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u3J8CL4Kku/3J5MKdzSmZWuexbF26F3wECGjeGWRhKg=;
 b=fpfMiAu3isF6LHOLZkGWFknEu73N1fOnorzRPQi69EwtY+NAlrj/NB445vlcmtch0S
 RGYIlkgb+m9NDCZ8M32vV+A3W0iOGRN66/5MTZPEujvmG7bHtHcxFbWS9r30dic7oYwe
 /EC56S38OG7FrxkvNZl3jg070wgVTEpQu+QHVSYM0vhLhhnf1a0M0ZZQZUtDQus9OXB1
 nxYClaFZfS+m6H5Na40RxPAbDFeCRpFpDuldg9M8DotbUBFwsmzfIee38Q6Kr2spdx/t
 PPgENtlj2R90cXOgXz+MB7PdjBNX6BFl+PNozHo+G9kpOL14fU+EM2c0j/1gP9py4Wsr
 6ggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u3J8CL4Kku/3J5MKdzSmZWuexbF26F3wECGjeGWRhKg=;
 b=S9gRSWnrnI+CcpG5q9TkqA1tPFb8HbUx4eheyKAFFDIPJJ42oS0f9e1Rs9T8HZkhX3
 iBPl9jhm6lWxojntnVKNdLZZk2yIL3GK6ZDmm61YJdUaOauxainKvPwQ2YB3p0YFJW5J
 yuaSzXQl+JPhkjPKHZrU+qY5g8lHQqvFC7yURUSu5qW3bzZagdyiQNTuDnmdHDfSgD6k
 MSMPhAvZKVqvKo2du9Xqux42wZK6jirELH0JEa/IMDTNURWPiz8CKy5OzP7h5CgLF8mO
 9e7P9sslnBz2GkiXEm1RXLdMcmSXsuGCRlqvtJjB7vZrmfGxTClU6t94Vv7XOYH8UiTp
 8nZA==
X-Gm-Message-State: AOAM532iCfJZLGz1+YheJcfuSUYHw0sJyEmB7NKHja1l4J0H8xdNK0zZ
 Jf5KKqDDa68guzrXEdpX1eXB5whXu/JEfLQzMig=
X-Google-Smtp-Source: ABdhPJzsMxFuu/rnJeQroifD1yPbnbttaZmc4s+1erBEeCemW50Kj4x36wY/D+9J7SnHhJWCj0D/54S5QXfthG2Tfhs=
X-Received: by 2002:a17:906:3ce9:: with SMTP id
 d9mr7864716ejh.172.1621369050674; 
 Tue, 18 May 2021 13:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210517203724.1006254-1-martin.blumenstingl@googlemail.com>
 <20210517203724.1006254-4-martin.blumenstingl@googlemail.com>
 <1jo8d81nw3.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jo8d81nw3.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 18 May 2021 22:17:19 +0200
Message-ID: <CAFBinCBREyEp0gj_-ac2OccjSruULPG1m2=L5D7GEA4HoqQqLg@mail.gmail.com>
Subject: Re: [PATCH RFC v1 3/3] clk: meson: pll: switch to determine_rate for
 the PLL ops
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, 
 Neil Armstrong <narmstrong@baylibre.com>, linux-clk@vger.kernel.org,
 khilman@baylibre.com, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_131737_070863_349412FF 
X-CRM114-Status: GOOD (  14.52  )
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

Hi Jerome,

On Tue, May 18, 2021 at 9:50 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Mon 17 May 2021 at 22:37, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
> > This increases the maxmium supported frequency on 32-bit systems from
> > 2^31 (signed long as used by clk_ops.round_rate, maximum value:
> > approx. 2.14GHz) to 2^32 (unsigned long as used by
> > clk_ops.determine_rate, maximum value: approx. 4.29GHz).
> > On Meson8/8b/8m2 the HDMI PLL and it's OD (post-dividers) are
> > capable of running at up to 2.97GHz. So switch the divider
> > implementation in clk-regmap to clk_ops.determine_rate to support these
> > higher frequencies on 32-bit systems.
> >
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> Looks good. I see no reason to keep this one as RFC.
Great, thanks for checking!

> I can take it directly if this is OK with you ?
That would be amazing.
Obviously no objections from my side :-)


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
