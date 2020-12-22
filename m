Return-Path: <SRS0=MUs3=F2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39505C433DB
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Dec 2020 16:45:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8F6623103
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Dec 2020 16:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8F6623103
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vm1OcE0l09hH3GVkcPabwp1dBywW0HaV4le3vqmvTMM=; b=cnFZTYUtCsjXeiyv8b9ht1EhCI
	9XTXAaq8fB5UDgFy7LKa52fS8PHCCd32pYxa7p+CS8axnRjkls+50cIOGPcmIVhWAVYUugfbfilPf
	7hwHeblg0A24vFKe0PnqKE2/dPIpFlfqxJOUejSy/at2EAs871tsW4xUD1HQe2Ac2ukhn8oWhRd/c
	j0A4uLO+Fpe8WNLwVE+D6TPuPelnrlwSncJQfXtmQBQ7ZqrbbXmjCZpKRVcNpAuCPqowd8U67Zthg
	ntjkF5RXZStA5x6EW93F/3xBJoPXIXd/1dUndyZc7EdAO/KXMU7/fQ7JImp48nPCn/6KIfcs9T8j9
	SbL4p/8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krkn1-0004kE-40; Tue, 22 Dec 2020 16:45:35 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krkmy-0004jj-9b
 for linux-amlogic@lists.infradead.org; Tue, 22 Dec 2020 16:45:33 +0000
Received: by mail-ej1-x629.google.com with SMTP id lt17so19102165ejb.3
 for <linux-amlogic@lists.infradead.org>; Tue, 22 Dec 2020 08:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=RqzStz4ozysucy26SJgzcqE6nfiNeIgXJaQ2kT0IuDs=;
 b=M8/N/g3xIjecbm0eUycIgxS8JcUJMYX+Nidv2RstiluhxMoWYe2lbMGhx0dxXVeekL
 B/W4wQisRLchwEsSQ0X/Bhwr2mqtcEszvIf5EzLDyqRFFTWlJEDyNiTjS2oKYLAOx0nd
 YwDKmusYNb6hi6R7/HiQivypRfYJYSSVJ7OLi6FpFU/lgZxOnyMAE+ISQeVPtOV1sFJk
 OI8C/B3NnhU+pNWnTSx3RTElgc18cocviaFsLrYv5fUJg4YnBfZn4X5dWzRjEu2bXo5x
 n/v/gq64x5MNY/ssuwU1Azy6bE8MWjnK2PvukEM+2d1y9FP27ahbwCcpunKuV7hijxLv
 zSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=RqzStz4ozysucy26SJgzcqE6nfiNeIgXJaQ2kT0IuDs=;
 b=VsD+lbOAs5A0exWGhGYN/FrkLkVRehY5J17CHTo8JyNowiv7MtO6OouTsxGdffrCwO
 9syE293rLJrPPNPYC9sKTuSfqYNoGaIxOquQLlGxXdsGtb09KkM50+c/C3iV3iUUspR3
 ypMLsBs5uQUaSTi2uvoRBCDsRIwp4W9oD6eEei0YLKJ59bA/6FS4AVLfO7kLlqbbKFSA
 YHhRRmpvx7lLU3Dgw3o6sdY8FH0VTo184jGI/1qHrSS/wflY2oS776DQOzO2SqNMsO2k
 AhXe4sqES0tAOnJrB+gDZcx8oD0cWPCey3tShSbuZrZisPTw+86zZfId4hMT8CTscpdV
 4Eqw==
X-Gm-Message-State: AOAM532YJHeNeUj18qTxrLJf6G6wZSMeIidZV1Zg4Ncr2+VrNV8Z+GKe
 m/k5IyDWKj4BHta2/KaqXErfDoOyKpHNvnE5EB8=
X-Google-Smtp-Source: ABdhPJzMihwnVQYmHan0tiOfldhXb7OTnV+gbhIrc2Z7XgqZrnkRMPeFCJNPC9Sm2AanE4aNdJNms+DTugbwnzOLeUc=
X-Received: by 2002:a17:906:a415:: with SMTP id
 l21mr20407198ejz.2.1608655529686; 
 Tue, 22 Dec 2020 08:45:29 -0800 (PST)
MIME-Version: 1.0
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 22 Dec 2020 17:45:19 +0100
Message-ID: <CAFBinCAdq59k5wY_K+_NCxx-PLrp+eAsfOE1jkj4q5TFn7ruEg@mail.gmail.com>
Subject: linux-amlogic patchwork not showing new patches
To: webmaster@kernel.org, dwm2@infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_114532_376879_A7D93B5D 
X-CRM114-Status: UNSURE (   6.50  )
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
Cc: linux-amlogic@lists.infradead.org, khilman@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello,

our linux-amlogic patchwork [0] is not showing newly sent patches.
The last patch showing up there is from December 3rd 2020.

Mails are showing up in our mailing list archive though: [1]

One example for a patch which is missing is "net: stmmac:
dwmac-meson8b: ignore the second clock input" [2] sent by me.
The date header from the mail: Sat, 19 Dec 2020 14:50:36 +0100

Who can look into this issue and help getting it fixed?


Thank you in advance and best regards,
Martin


[0] https://patchwork.kernel.org/project/linux-amlogic/list/?state=%2A&archive=both
[1] http://lists.infradead.org/pipermail/linux-amlogic/2020-December/thread.html
[2] http://lists.infradead.org/pipermail/linux-amlogic/2020-December/009360.html

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
