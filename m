Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFFDC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 May 2022 07:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wvh2g5VvsYgtlnb7piDNNP2h7uT2YxlaM5okoC1DTjo=; b=Ocf698YO7iQmNe
	pLxB3n86//cCERTip/4EYxwmMxQ80Gi4GhU9PXhioLqboXRD99Mq+6wXOXQT7WMtylbetFiX+c24T
	n0++VcqSmYQXybLqRXBVSrR3O6pUyPbQt16goBsPiPm0CUUq+o8TZkNgBN3WHK+tykd2wR2oVbmuq
	SgiRPGqtg6EzYhPMSxE/xdApjEgX0gWglX+mxmupXAuLshLNHaWsy6DzCIWEJXwVhGd/viM3TqN63
	5g5O5/TZ6GRg/VfMijq69IDTr4R2+kJ6BkTrR5MkyWmwdGRm/W8G+ZKbUcu2e2oIrqxcSxMpRSDEA
	H/DstOhbXGe00Ti0I0QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntlJt-00ABOU-E6; Wed, 25 May 2022 07:20:37 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntlJg-00ABJp-6O
 for linux-amlogic@lists.infradead.org; Wed, 25 May 2022 07:20:27 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 i20-20020a05600c355400b0039456976dcaso2058162wmq.1
 for <linux-amlogic@lists.infradead.org>; Wed, 25 May 2022 00:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uYFYfxoNsvqjWq3cVk8VAYueu2Qkp0ObH+2Y6ZW4tVQ=;
 b=XGpLDihouofUM8O+WmU1hMyTds9voxGLf2+10wlHnzh7857rKLTFOqqXtMoSjsfNvP
 Fr5/cKEMJ4/Z0pLAKITrhaptemgAWoTemUTcbHDdeJ0jPzlt7IPwzI1eNbBxWK4p/ieo
 OcO+hgtPh/7vrrg9VpQ3A2L+PuPAcVRdWSaNsCGkkDa1tukQN4TXCuNYulrDRpo3Bxq1
 LLOgpadflKlxpb+nUge2e2FE2vlqm0wWaw9T7Ml0niU0IM2gz6D6cCA1RfygadWp/MxG
 gYOacGo98zJFr91/uk30yQ8wWmAsxzjuqY4ncIrFaB9DzdBeX/pX61FK0DWB+JoGU/es
 nzXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uYFYfxoNsvqjWq3cVk8VAYueu2Qkp0ObH+2Y6ZW4tVQ=;
 b=ue8w3YPx53W+wYx0l3KRTHs4mWcKET+Nkn5qjrIPNPcILVVPAbFb/x92tYgWbR+sPJ
 yLXtOAUQ2i0P3XNVdezvUWLPqME1Gr4hz2uZoZjGcdGJsEp0ytcgw7Tkny8qAORAZGSH
 v/AakDQF9itdIW7GDqHuMS9toxT23yjoBc37QaOH/PCm6eNVIdz9pvW5f1jiAqIaFdg1
 gTlkxNR02SoVd+45TGWfAJTA1BWXlngiyIfnp/QzKDo8PqL7cTZVX6hDnuHdvSj2XdvJ
 0ZXalLKx6lI8hgEZA2NJBrm9qssqIiGqyu2fFlKGoM7ZAGQlvwyEPI3kNm5pvY3/rS13
 /RhA==
X-Gm-Message-State: AOAM530Nd7Nk5916LMk952GQ4gOhcmLwgxggx9tCoxFQJF+8ojXzpLoe
 AnhYyiLMCmqJtjV2pea1BARFiw==
X-Google-Smtp-Source: ABdhPJzJ6lz+uvAOJ07h80qckjrMvByvZ0P4qBjlYnuhD69PdbR1PHuv8YidpCb+7KBJOIQ0a9GHxQ==
X-Received: by 2002:a05:600c:3482:b0:397:4abe:9f8e with SMTP id
 a2-20020a05600c348200b003974abe9f8emr6827443wmq.71.1653463219696; 
 Wed, 25 May 2022 00:20:19 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a5d46ce000000b0020ff3a2a925sm1529240wrs.63.2022.05.25.00.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 00:20:19 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Miaoqian Lin <linmq006@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] meson-mx-socinfo: Fix refcount leak in
 meson_mx_socinfo_init
Date: Wed, 25 May 2022 09:20:16 +0200
Message-Id: <165346315887.272786.7785185844599075827.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220524065729.33689-1-linmq006@gmail.com>
References: <20220524065729.33689-1-linmq006@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_002024_511272_37615393 
X-CRM114-Status: GOOD (  12.74  )
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

Hi,

On Tue, 24 May 2022 10:57:29 +0400, Miaoqian Lin wrote:
> of_find_matching_node() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.20/drivers)

[1/1] meson-mx-socinfo: Fix refcount leak in meson_mx_socinfo_init
      https://git.kernel.org/amlogic/c/a2106f38077e78afcb4bf98fdda3e162118cfb3d

These changes has been applied on the intermediate git tree [1].

The v5.20/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
