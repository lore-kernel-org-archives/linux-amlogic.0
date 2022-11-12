Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4A1C433FE
	for <linux-amlogic@archiver.kernel.org>; Sat, 12 Nov 2022 23:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DBSUcIZ/MgtT8hn9L/D3hW8Fr7IHfmzKGcU6b5aLdys=; b=VBFTfH615IQ9G3
	Tbn0Yt/Jzgd/0JVAPMNVFOXFlS9em3Jt0oIR0PTrMsQahH+joule+iLqg/ZtjyIXEtLaBVzhaYaW1
	QWU/LpJd+iOimAuWmrSs9otkQh7Ec8WZKapzD5zUQd2qr3qH/0Re304+ow+E7M1fCNcOVu9CdZIhL
	pHVJmSxN/uotsxd1pvBdDhznF6wWAQ6R9TlmTzTv9y1+OkfJPtwmaCZ4K+GyKhIduJKol3DT8WuGG
	WrSEff11KtQQolsB50f86l21VHZ9OWgfuSZPRV3pu20pzb+hAjojboSav+07+CD2IR+QrRkj2WtUm
	6JxfFub31cdwnvrJ5RfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otzVe-008J1G-2H; Sat, 12 Nov 2022 23:01:58 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otzVT-008Iyh-6d; Sat, 12 Nov 2022 23:01:48 +0000
Received: by mail-ed1-x52b.google.com with SMTP id z18so12313190edb.9;
        Sat, 12 Nov 2022 15:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zTbt0a2xJBfSnRn2u4bWAXagh9TkCUBqkSMMFYc2JtM=;
        b=p5AEsQfdKfMpFJhMp9ygeLOWB2CLmtACLTJbqsdS/KD2gw5yBHqFWqaaf549kFa0Pb
         1yM3htcAbsJiemoZpQns8tVXsEOQpyKdAUwCkLSR7idEkuPl7UwELwzkGCZUdGR9N1o9
         01sQworEj8hnwCMC/ZzL2jlrTTO0kFSj0on36SrA6s4QOilgG+Kd9Wu6IYKWYmpK5i18
         NHi40mjySwSbA4qxiAhPRXePvbOGSd3fIrWKHPdGkKemcXoMcsey+1ZQpOE97OQAfywr
         eGyPk5lN+ru6a9a4Lihsmpn7AS/qozFUWiTduCvbQCxMXQBEEZW43xGJv3KZqD3Jpf0S
         35hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTbt0a2xJBfSnRn2u4bWAXagh9TkCUBqkSMMFYc2JtM=;
        b=xOCOLUd7YMp3vMaOw+/HNtrZxkpVddB9WKsbTOOEvpRkW16aKzWVR1JKRJBCBt4nYq
         N8tSUDx+Z3Nhd+gM/EktckePJkx79ORqCmsWeT2xgW3jqeUZjoT8YB88+e11z9SLNJU0
         3YvQ1K2rqLCrzuZai8TxW6IGkk5yvU7/WZzrib/n7Ainwve0U+mi6u+myM1E2xCgDu/6
         LDxdJILG0Z7Vd4Kk/in0PAFZ7czgUkLYyivux4GruzFUP70s6e+D4hbXEAB/UhOJMH5s
         j4iGwDqQPVvky6zqCGQ1dilb+nRZ2bBYE07u28rqKpTjjMMEZqqYWvq2Qj5pTeJbT9Bq
         zmbQ==
X-Gm-Message-State: ANoB5pmQEfEFmP5CTUzYNK/U8mVmPp2AsSEiLOYUKMmmfJor05sYwshm
	ZaNARbBIdAd8pIjD9kOjbaaGgHbKwSHDAl35IeM=
X-Google-Smtp-Source: AA0mqf4emPWDsB0Q2Akmslx3fIfr+lkWa5caJWrUvj1LbBOb6Um4B99gTwlj5Q0yAIbFuMDaXuSEUBuyWRxPJOGvoB8=
X-Received: by 2002:a05:6402:715:b0:461:9fe:6d8a with SMTP id
 w21-20020a056402071500b0046109fe6d8amr6453263edx.4.1668294104583; Sat, 12 Nov
 2022 15:01:44 -0800 (PST)
MIME-Version: 1.0
References: <20221110150035.2824580-1-adeep@lexina.in> <20221110150035.2824580-5-adeep@lexina.in>
In-Reply-To: <20221110150035.2824580-5-adeep@lexina.in>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 13 Nov 2022 00:01:33 +0100
Message-ID: <CAFBinCCch3RsJbnA602tH924umRVdbgr-20g2F3mYLWCDrkg4Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: docs: Update mmc meson-gx documentation
 for new config option amlogic,mmc-phase
To: Vyacheslav Bocharov <adeep@lexina.in>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221112_150147_262254_A5187317 
X-CRM114-Status: UNSURE (   7.36  )
X-CRM114-Notice: Please train this message.
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

Hi Vyacheslav,

On Thu, Nov 10, 2022 at 4:01 PM Vyacheslav Bocharov <adeep@lexina.in> wrote:
[...]
> +- amlogic,mmc-phases: 3-element array of clock phases for core, tx, rx clock with values:
> +       0: CLK_PHASE_0 - 0 phase
> +       1: CLK_PHASE_90 - 90 phase
> +       2: CLK_PHASE_180 - 180 phase
> +       3: CLK_PHASE_270 - 270 phase
As mentioned in another patch: I'd go with the human readable values
(0, 90, 180, 270) instead of the register bits.

[...]
> +               amlogic,mmc-phases = <CLK_PHASE_180 CLK_PHASE_0 CLK_PHASE_0>;
Also I *think* the format here is not correct, for an array of three
u32 values this should be:
  amlogic,mmc-phases = <CLK_PHASE_180>, <CLK_PHASE_0>, <CLK_PHASE_0>;


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
