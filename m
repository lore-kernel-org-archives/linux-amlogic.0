Return-Path: <SRS0=++Ji=X5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A070C4360C
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Oct 2019 04:32:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DE4820862
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Oct 2019 04:32:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DlwcoX3y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjGXRHWS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DE4820862
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mAvpQyV09hyS9bzd0z0/cWrgwjJV0RLD6so1myx4IrI=; b=DlwcoX3yfelGL4
	Hlydi+cIx2bIuiFfqNTjF9m55EeMiqSd9fRnZoAumMn3g5WAT+7PTf25WFuJuzqk3Ww1S+BOXgmUF
	10z0H6hzbZEMNu+ngbPfC3Ow6CBeISKF1O6yHlERHbLoEdq6IyrqIFxkfuj2y1pPvBV+7XLrR1yrF
	7Xy83h25gBGSYstjMgX7zwH4I7rgJreJ7vt5XHehrmg1pXx76E/SQ5Goe97d7sa8rlcMZNOG0gHIL
	/IC2Tqg7sp0I61t94WTl6LRMFBqaHZTk/krtS6RsnpxvlEo52cJ//bs1mtaDexgyNa9MCYpppjxw2
	OGuWs3ielT0I9hz+sS2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGFGY-0002pL-KD; Fri, 04 Oct 2019 04:32:30 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGFGQ-0002hj-Bm; Fri, 04 Oct 2019 04:32:23 +0000
Received: by mail-io1-xd42.google.com with SMTP id c25so10621949iot.12;
 Thu, 03 Oct 2019 21:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U2nPEB8rA+jsS1ttiFP8H7C3sJ9YdpuV2AmlRtnRHNE=;
 b=FjGXRHWSfuV14PudxoZgKdFd8ltv961tGHcnbLKmjsa/8Uxx+EWhq7bj6GRhk0Y2Uk
 cBFZsicCoqGWvpVrqOYFxpSKDDcmO7jxewrw3RTu6BUhrTknGYpky0aitsvBQD6E35Ep
 IjUzkTkmOPkaZusSeOV42d1j3ZS+H788zPtSxBPhOEZKhwkppVUXs8PMfjT2oyx5Zrax
 MPTxOZBpZDwGqQCwLXDeVZCfi/scdGmfDlobCyraMDumz3+n+zGypsIDJl1TpJt5jx/b
 sXoc8jC3of4xksEFXbAUVC/OozUWrHyqDxEb7+xc2AsXvV5XrMeW+vNoADWPiFneIM8O
 BdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U2nPEB8rA+jsS1ttiFP8H7C3sJ9YdpuV2AmlRtnRHNE=;
 b=iV+DCgSHX1kqBjBuwFsTv+fM6ij4J0VpPGpQ2dfD2djQ8BLH3M9z/kyAKLSO07A5fe
 EKeKC2AzW0IhBZXA5dqYXBd4PjKxe1wO0Su+nYNHpm781I7DlcWqSYrKij/kQx1eQirG
 2R2U3qvzFmo6l2flTbV2LonEOyYoXOEkaGei2N/G2gr2I4wQTggqsYrTPwprF3qdUOt4
 PPGLG7EcLAtIVYc5yfTfDyrIceDmuakQkea/HHL2LvhoGHoCjZGYSjJsfj9JaYcMa4F3
 +Gdg+I3e7hu0eEMwu5OkwoNaUHyWcZxBO977uCp98v+scnt9Viwg8NYIagmDx4xf0CPl
 4G0Q==
X-Gm-Message-State: APjAAAVrXddTzC0VQb/R3bB9FyTMpNrHdzDZZFESys2vQnExkEQQm+EN
 7uhUQjw8TmtEyEwdKqfN89Q0tl4LKrgIJnSCZMw=
X-Google-Smtp-Source: APXvYqxINY9ZmOJ0xUuloWso3ea+rJC4QHAazPL//m6xavj5isViQ/kZj9Vg0IapF0O5kPX2bKwnma2M8zAZrGTvqDk=
X-Received: by 2002:a02:245:: with SMTP id 66mr12608668jau.30.1570163540786;
 Thu, 03 Oct 2019 21:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <20191001073901.372-1-linux.amoon@gmail.com>
 <7hv9t5vi5d.fsf@baylibre.com>
In-Reply-To: <7hv9t5vi5d.fsf@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 4 Oct 2019 10:02:08 +0530
Message-ID: <CANAwSgTR5mnBLGSQcq6xj3yBvu6J1FDKdiLGfaVybtN6HqsAuA@mail.gmail.com>
Subject: Re: [PATCHv3 RESEND-next 0/3] Odroid c2 missing regulator linking
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191003_213222_402682_3AEB5E55 
X-CRM114-Status: UNSURE (   7.57  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Kevin,

On Thu, 3 Oct 2019 at 23:14, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Anand Moon <linux.amoon@gmail.com> writes:
>
> > Looks like this changes got lost so resend these changes again.
>
> Yeah, sorry about that.  Your cover letter subjects were quite similar,
> and several versions of this series and the previoius series arrived
> close together, so some stuff fell through the cracks.  Sorry about
> that.
I will keep this in my mind and do not repeat my silly mistakes.

>
> Queued for v5.5 now,
>
> Thanks,
No worries, thanks for the update!

>
> Kevin

Best Regards
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
