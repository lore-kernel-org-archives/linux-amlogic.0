Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2212AC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Nov 2021 10:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uW6NOxCDDt09TJnxDCoqqJYkDSvLSGKVI61T3SP3Iq4=; b=gB2O7WZRf0OYt6
	t5lOmjXBxiMTg76XShNg+jYrWIRhNYRQ9BWTvDzgar64NXfhKS//EY8oaPFcmlQIoNv4/n99u7mW6
	arC3Rk/UPeq/uaddeW1iO16S0LYri2vM+Tl3fQTFPcg6mfepp+IeoCEb+qqNtOw6iW0+/W3M+Pdku
	+DgHy6QyfrEJB+NYJ20OlBfikKjVpoyANfXf/0K+tzdtNigMzeKL5+CbEI3jt8HRSH3T3YKmhoI5W
	aMvZNhFRHjCXxakOtifPZDdh6x+eeLwLnksBUglHz85yU+OviprxE9A2tGFrGMptDJLdCiJZ2fOFb
	yVkM0/m1kUyJ4XBw6VTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms0dL-004i3w-Jn; Tue, 30 Nov 2021 10:45:11 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms0cC-004hY6-VA
 for linux-amlogic@lists.infradead.org; Tue, 30 Nov 2021 10:44:02 +0000
Received: by mail-wr1-x429.google.com with SMTP id c4so43345651wrd.9
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Nov 2021 02:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/dRrW73L/+aQvawdDWHM9eDTSLKvhZrt7/ceBiWtq0Q=;
 b=2aFe8uZRO1Htx0Beqk4tImbRLvYAba/GKyjPzF6n6hAWf/GzPWblHuO4bONfs5gBAI
 zlWNhrihD3l0hMGdePAQltyWYcnaX/0vKJ4S4rDRxqbpHVF2VcQCREIhHG715y8mLE0J
 pO8O/Nt4Tz9uyKOOuwMesK94SO3J1MR3D1Io5VFucyCIbo5R6alLQ/vsRT5HZArfobc+
 4BYDrqQUKZn+Iv+HL7UZxdd4F+h5B2bELBiqa3W43Tzoe5GeLV628VhZcjboalsQZB4d
 4jIR5oHKZGiFWOUhl59rrvd3Xt68gkEtEUJC2CBnFpwjQ4G9ZN85raIPSPp6d4vU+zxG
 ZC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/dRrW73L/+aQvawdDWHM9eDTSLKvhZrt7/ceBiWtq0Q=;
 b=q48rRxcoB9Ub/etTQs/Hew0BL50t+wAjRWoKB3ZZ219oeMtnR+TmBp5ihRSq02IVYx
 8e2RWkaPaC3t9ABhHduJXp7OETA/2p96HHy0iR9zwDjFi+PiVOtt673yW9N2DHIPtUX1
 CSqHlTqc8F4eR8UxA3eRjcNIodc8Ml14pzp63B50W3urJOS8Uk9loK+SaU85FbVngdBO
 +vjlxHg7Andn5JYQcIK+o2btaHZ7ISxmTmUjZCxUUaKKVYtoeQ6Uf8JPW0FVTdVDak16
 ch/x7tXdzxNzjCnOxpfXGMA1SqlMATlc4cO4dZ3RyfJAe2Q5h/51v/m98MXlO00DIzZV
 +Qhw==
X-Gm-Message-State: AOAM530dtRu05vJuPIqZk3XUcHxnodNv1Gn+BYOAlfAiEKe5F0efvCyC
 /inIeB++BdZj3B8Hy70AjszNsA==
X-Google-Smtp-Source: ABdhPJxEpdVKo8wvsxi4+aXMUdgoRqK5cg2Kk9uYqcgTsf2EFPRvq6FKcxgHoepgS9UQiRhCQE6qJA==
X-Received: by 2002:a05:6000:1acd:: with SMTP id
 i13mr39844590wry.398.1638269039704; 
 Tue, 30 Nov 2021 02:43:59 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f80b:b9bd:4d6e:b61a])
 by smtp.gmail.com with ESMTPSA id l21sm16186804wrb.38.2021.11.30.02.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 02:43:59 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: meson: p241: add internal sound support
Date: Tue, 30 Nov 2021 11:43:58 +0100
Message-Id: <163826902317.1314212.8226710157799410590.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130100159.214489-1-jbrunet@baylibre.com>
References: <20211130100159.214489-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_024401_051739_4BDE1B95 
X-CRM114-Status: UNSURE (   9.03  )
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

Hi,

On Tue, 30 Nov 2021 11:01:57 +0100, Jerome Brunet wrote:
> This patchset adds support for the internal sound card of the s805x p241
> reference design. Audio is available on HDMI and 3.5mm jack connector.
> 
> Jerome Brunet (2):
>   arm64: dts: meson: p241: add vcc_5v regulator
>   arm64: dts: meson: p241: add sound support
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.17/dt64)

[1/2] arm64: dts: meson: p241: add vcc_5v regulator
      https://git.kernel.org/amlogic/c/bca54f711c0a2506efcce03a02f96f39b311f188
[2/2] arm64: dts: meson: p241: add sound support
      https://git.kernel.org/amlogic/c/c5468e3c930d4d2937d3a842a85df0f74e95e152

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
