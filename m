Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E413AC3DA7D
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Jan 2023 21:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6iNbDX+REPbD9gQDqkZWz6RdQBaAz47hBxYRqlJ4T5A=; b=FtX61IlKkQgATZ
	ENpCXw0iscXBGx8SYTyFv+GH5KGqPuDWhDIpfsE5m0gZR+4iAFckCoUzI9MrXrnTkLMWQl9cE8Huq
	hkcryZ/cgCs77qQ9DwzgBr/98t31tqCY2nppcrLkMBEHdgrMrt83PI7iCut78ZW/+J763PNFMXtOk
	SOOYJ/jUwKdWL1jKo7ZienSUZ8JgFHmXapHkVSWG1g4xg4qEa6iiygig5m87sUX6uFQoajLiibZbh
	BvhJ0UFpg70NbqeQ86eEqgq4/AHB93gk57gkXtSLv34N4iKAH6G9LXULOl/7cizQotAr1tzrVLPlA
	ljTtByY3iJXKklJNLHOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDXkb-00F59g-RO; Thu, 05 Jan 2023 21:26:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDUvn-00DYVG-2H; Thu, 05 Jan 2023 18:25:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WvvqYY5s/p4UKsDcdDT2P76h+1GoNIzXHlLl5rK0J5Y=; b=IqObTq630Haga0F7qETaDV5ZKQ
	8gRnIsTA50Cj0WbbcErApKEVsqWzaADWw/k4x43f1GY/LULYSBdrFrH+B/z25qa3QTiG1cx81XTP+
	Kb93nWDXExLj/8HUFsEKaK0C0vIiFg3mXxltvNAHKpNtFinZKR+tQYve8pq5OA2GAXOQix13GR+dL
	e2fBfv/ldytXdtoVd8JqBXgUAYij9g2bx3hxff+RISwJi4P630DbXAjU58Mz1/13u3JSbpmp77mqT
	OFBVTboEpIXQHE3HHhOYQyglSijRGwCyQDg+i//A7eIIQAagfuBWW9Wfm9a0IUrJ3lOsKjGS3gUKz
	R7U+5U7Q==;
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDTqY-001WjK-0P;
	Thu, 05 Jan 2023 17:16:09 +0000
Received: by mail-ej1-x635.google.com with SMTP id kw15so91420151ejc.10;
        Thu, 05 Jan 2023 09:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WvvqYY5s/p4UKsDcdDT2P76h+1GoNIzXHlLl5rK0J5Y=;
        b=iZEK8DG7TzbXkQinbCbGYMX+DbV1W3AsT0+ao07brg8vqFPmZ5coswf9D12KK07xyk
         HCYZjTtwmTy0Ef0s/hvu+hhRjJBHpIhmVjYakjqAOzpGXH1mdg+RPaYKuLmUD0Kda0Sx
         H5LUImHWf8mxbCAml8ObJJgMhMpocI9kHS1Un6IwtM4AdedNie7V0l1BcGBzl15PoTrD
         R5KK8zgvEoST6YbU7jHUQK22nJZwf424OS3RNEcfbxtkB7cmYChK+hwqYW/fNSZa9k7c
         J1ct7htShQZgh1KlEYWkFSc2UT33vBhIu75C99TsojzMymIeF/Z3IsgtZb71w8eqhctI
         VBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WvvqYY5s/p4UKsDcdDT2P76h+1GoNIzXHlLl5rK0J5Y=;
        b=XoQwbLPulfAGBIW/7fZrlzLY594Eow4DjO0mWuhCE7Vs9HMaY44jkmwDxhy5gqsw1b
         6kDf1rp1kSPxhvkjFiX6ta5/q0SkhNEu3wBPOpXnnDDJq/Sy3wso4n+Xz41knBrUN/+u
         ozOBhDq7JGeNGOq9FvDat/gHZ+KekLwXzM4EGVeT8zAtn9pljRt1d2EW/TsAiMZU2i/G
         H+QLbvzaNtcEjXbgdq4H1m3CnAkbfr7brmxH0+p9LNeABwLgs3p3fDUsvbYAhzSUiRfz
         ETIqfFb9i+SMzNVGO+BgITZSHWbFqCLU1X8R5skrI+mAqyqZC3QZq+gMrGtREgzGB1vT
         Jtjw==
X-Gm-Message-State: AFqh2kreHw77M5ItrIKh2RJqiJiZfSZvwnfkAx4IGrXc4ObzP+plw1TR
	uoP2ubQ/juIBGKPOrgrMfFoyPS5ZTPwj7Ksiu0s=
X-Google-Smtp-Source: AMrXdXucxlF31uJRGdZfK0reHp9aztBFHCqxvZq/aTa5b0JtQPXDl8ZzagVA1geoBYQ8h604b4NpQPlW8PvHlWbAyfc=
X-Received: by 2002:a17:906:81cf:b0:7c1:6b9e:6f5d with SMTP id
 e15-20020a17090681cf00b007c16b9e6f5dmr4501794ejx.339.1672938970088; Thu, 05
 Jan 2023 09:16:10 -0800 (PST)
MIME-Version: 1.0
References: <20230104140608.28432-1-nemunaire@nemunai.re> <20230105120206.28964-1-nemunaire@nemunai.re>
In-Reply-To: <20230105120206.28964-1-nemunaire@nemunai.re>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 5 Jan 2023 18:15:59 +0100
Message-ID: <CAFBinCB8Vgfc93h_pctK4bp1-uuWhXvJw_SUDbbqT3LYiSCn5w@mail.gmail.com>
Subject: Re: [PATCH v2] Revert "arm64: dts: meson-sm1-odroid-hc4: disable
 unused USB PHY0"
To: Pierre-Olivier Mercier <nemunaire@nemunai.re>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_171606_347066_57B0129B 
X-CRM114-Status: UNSURE (   7.10  )
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

On Thu, Jan 5, 2023 at 1:06 PM Pierre-Olivier Mercier
<nemunaire@nemunai.re> wrote:
>
> This reverts commit 703e84d6615a4a95fb504c8f2e4c9426b86f3930.
>
> USB device enumeration was not working on Odroid HC4 as both USB2 PHYs
> need to be enabled. This is inherited from the GLX USB design [1].
>
> [1]: https://lore.kernel.org/all/20170814224542.18257-1-martin.blumenstingl@googlemail.com/T/
>
> Signed-off-by: Pierre-Olivier Mercier <nemunaire@nemunai.re>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
