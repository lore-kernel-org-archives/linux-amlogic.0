Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9038C54E60
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Mar 2024 07:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=NLoo/gsOxwtGRT5hyINtjKSTeEX52nCVM/4g/HB35/I=; b=aZA
	NiKB15oDlK5Z5hnuOdNfE49pT9ZmPcTUI/k/qxDpJmBrgHHc7Yvjt68JlBQ/kjtFfyxbpoUgGNKgD
	WeUH5mshZiZuHmf7/T9SPankHnud5QeNoTsQ04wp2P1AaVApvhHFpDrgGYAs7RUSZiX0+psz2Q2PR
	Sm4TxpRujq/+M/NybiC6D+Yhd4I/NUueqmYSFA28hiC0gZtDQpAZ8pDW5rENARRRQdXpDc4kTiuQv
	x7p9I8tNWOhvGrafn9rdhHUO3Iqf3rvEvErd7cKLFknn4v0/UyvF7EfY1yQ2HVLN1yvFKXWWbCqcc
	w+lPEtVS+VmUfHn3Qx7MuactL+K1BZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlkyW-00000004fUl-3G60;
	Sun, 17 Mar 2024 07:30:32 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlkyQ-00000004fTt-3P5z
	for linux-amlogic@lists.infradead.org;
	Sun, 17 Mar 2024 07:30:29 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2d2509c66daso46756391fa.3
        for <linux-amlogic@lists.infradead.org>; Sun, 17 Mar 2024 00:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710660623; x=1711265423; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jnnpolCCi1rdVTKbIA716/w3AlKcuHvl7+iY/Q0GiAo=;
        b=Apn7KA4woBqaKV10JmWMiZk2w30YoEPsTB7pVxOcQCw8qearYJuAOcVEVNGfNV8ZsN
         wm4E1RYxl1iCpk0KpqxKk9tZqjzKh37y2IZs6vAc1bFR7dYNvOKAJnwyiNFI5njFafcQ
         HGtmEDL8PBm3PsiWqBqs7YvDzAHOFO3D7SjGEP18JZJlDYUINTYFRj/0t5OUmsov95Hv
         gsQfXUuXsJnZrhfLe6147nPxuWSJVqly61eJvpOhmuROrsYnJSFpapGXGKElgF99rKSJ
         akQd+59Oagzt42Uay39TrjeVp2tz4NQ/kK4AncrPfW3qBmy9FOcquCooJ8B7JovTHK+X
         lOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710660623; x=1711265423;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jnnpolCCi1rdVTKbIA716/w3AlKcuHvl7+iY/Q0GiAo=;
        b=V8QXl0nsB2UNfVB0oV3hyEggm/CveO2N1D3/MhWi7b3/2dwBKaiiZs5Io9cGgqqToP
         IiG5AAl/IiyJDlTJRHGWPMhoMx7H5YQh+YlpR3si8WcZDmFZMuboL76Osffr7m3ip9Up
         5xTuUStzIIZNGKj8hFIwtjJFugtVZx3KL1HAaCblvuznhp0sT638xVKl2SwgX3viT6Sp
         12SckQgY0C3bN7U1I2KYRh30u8u0mIo7OWpq1oiwSfNtD8eNHeMTNjqKSVa5oJdB9S9C
         UeIC6RzmTD3JEf0VmV4w8XOn5ye9wKdPzr6x74ikaPrCcLqKmfQExMURXffHgtFr1MiC
         ZtNQ==
X-Gm-Message-State: AOJu0Yw8Wjmv20qWuOuvjwZ0R0KxSKymvrOqXzumuZFs8fGiw9xfLlJm
	l8xGukZxYVUrUUmWMtAXr3dcmvUawX+3CJVtlfTvT85LYJviSYJ/S+zy3VXZvOrbtgG4448A9jM
	LUMOhdJyeQPk++E2Gs21z0uyrqgYvKJmu4AkvbQ==
X-Google-Smtp-Source: AGHT+IEhuHxfGhY8NnMJFfZXSA9llmH/zWNzH/o4emFLgAZZc5oMgpDJc6EERobJQFwxL72MT79+x/xfUFt7UEaZxEo=
X-Received: by 2002:a2e:9008:0:b0:2d4:5bc6:23a9 with SMTP id
 h8-20020a2e9008000000b002d45bc623a9mr5644299ljg.33.1710660623113; Sun, 17 Mar
 2024 00:30:23 -0700 (PDT)
MIME-Version: 1.0
From: Yarden Bar <ayash.jorden@gmail.com>
Date: Sun, 17 Mar 2024 00:29:50 -0700
Message-ID: <CAJPGt+VZaRCVGcyQqJrn2woPHd1iNegfD--B1WroCUt5M7LPvA@mail.gmail.com>
Subject: How to Enable I2C on AML-A311D-CC
To: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_003026_985707_8642BA65 
X-CRM114-Status: UNSURE (   4.38  )
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

Hello,
I'm a ROS hobbyist and had nice progress with Libre.Computer Le-Potato
(s905x chip).
As I needed a stronger SBC, I got the Alta board, which has the
AML-A311D-CC chip.

I'm trying to wire a PWM Servo Driver via i2c (pinout [1]), pins
3,4,5,6, but I can't get device-tree i2c-1 overlay to work, or to even
be detected.

There's a thread in Libre.Computer Hub [2] from which I got to this
mailing list.
Looking for some guidance on this

Thanks!

[1] - https://docs.google.com/spreadsheets/d/1Ho4OXLqECX-Hy3DQ7zY0UbvHj-qfWhi_P0kPF80lTp4/edit#gid=0
[2] - https://hub.libre.computer/t/how-to-enable-i2c-on-aml-a311d-cc/3621

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
