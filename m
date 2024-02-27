Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B224C54798
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Feb 2024 13:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tr4KINksvfPt5xE/ZS4LKS7lXmcqJXSD9ZoM378sPcM=; b=Nou0KRkJB6D9gb
	xSuGq7CxHcBrVlfpSO8iWYtrdv+OhDyLoUYeKk6pRqZYgipucR5/1BZJQ12K1kRq0VbwUQk5VnVPs
	m8EW0g04zLhALXGyV6xxzc2VPRPPU4aGObw/CrPJtvL2FZz1PZqtpxXBk1sa1UUj0nBr5CyFtOqBs
	Wlx+PnIRYqgmrd45uNZJ2W33BCVMqDhoMhycJeNEG7sFmg5srWhFmIv2TCTp7LndPiELGb1yJcUG4
	+SAAFI/FSWtn0ykG0+642sSmlO7ymmdrU8BT4e6zdZ666ORUwrEkks5I0PYK7XynwQu9HudSx1RyN
	QqwuQ0G2jzi1PkcNe+ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rex7K-00000005Il1-1h2J;
	Tue, 27 Feb 2024 13:03:30 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rex7H-00000005Ijr-1AoB;
	Tue, 27 Feb 2024 13:03:28 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5a0919f2022so711950eaf.1;
        Tue, 27 Feb 2024 05:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709039004; x=1709643804; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4IP/lc1tu6L75ZltzpJOjRv1Wc7ej1h8ro3tZmKncqs=;
        b=LLYkEcS65H1uei4GbbtUiEPHJiYapgJf7jwT4HVBHGWzT4KwaL0cSU2AsaWw5U6rCi
         JwcZgywgdN456sXBs5ONcY3anrm/r6OEYjhRjFlH1JIg8xn3fv7x2YGFZ6N36qtgrskw
         mvTYaIPQM+1hcLrfoZm5d8c+ECXCTL1xAUlHSbwMwI7f2i01svV7iDC9t6OSqtpI/xyv
         1HgCTQzvlHg56lyXX72x2hESleRUYhSYcRrDBK9npbClj8nAPq6KdfktjUAd8B/iicvk
         gzVdEfK3mE/ckC3ddq0zd0scwxNiN4vhl9tBx7NSPO6Qq2zjeuG0XJaIJ/VkWmTlW1dy
         qG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709039004; x=1709643804;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4IP/lc1tu6L75ZltzpJOjRv1Wc7ej1h8ro3tZmKncqs=;
        b=qJvovNJb2sTz8qw0O9B12xM8X/uusD0Lz2auTau9Dsq5IFiXS/1/JrsbIDfB/IpFDL
         KR1cz2+wcTeAGxlIEqZ4cPjdEZSGeCjGrClcmCYkhuchswSewSa8Ed7EV0E0Rv9aTwzf
         Sg1Iwp9m/B8SFoDpwUe9SOUBd76kMYLciuOHxPY/Bu5fvIO9Yr2wWySLZ5BXszVIdvtf
         k5MrUf3ulG39gSQvJonF5r808EJtG5TozH4iupEpZXExlZaT1UMmJEwf7AFj//zNUy5O
         yCpax7d7CYI7Cyd1A3EgiXgf1il0ZaFfdkJeWGHjH4ILsg5pf+w/zikt3gp3wu/SbLI1
         s4EA==
X-Forwarded-Encrypted: i=1; AJvYcCWOzXrA++LM7HnVKvphbV6SMg+ffmr3d2ZTtFiJYFkBfrYMyMu09IM5uzye8BjRuMTVUiwaKgnqLMRsHJbpydWPik1W3Zed+1fJLoiL5F0cbbayElaO4Q1RgsqYdu85HVngALOVZfk07rhG7lorkkYDgS79X1lutA==
X-Gm-Message-State: AOJu0Yx2jOPNNVGFwoD4GmtjCkZukG4no4PxhucAqXDRorm8AXHZxEXO
	NE8uiPtoJ3Kkz88jhE1YIA2fxZZwN/tqhPaW5b3EnX5L9i8xVwwGci/joE3idm2m9OUvbbg68Fu
	L45HH+9J+cwPYD0SDFK1GM15DBgI=
X-Google-Smtp-Source: AGHT+IGAP8utKe86sQghKbQOxWb39Elk4eQMDdlg0E4ZOowf5TBPfCkJPQMtKF7OVN8Y9rNxMQ7LLdcQY/Q9n9gM9LE=
X-Received: by 2002:a4a:c80a:0:b0:5a0:9513:484d with SMTP id
 s10-20020a4ac80a000000b005a09513484dmr4603772ooq.9.1709039004466; Tue, 27 Feb
 2024 05:03:24 -0800 (PST)
MIME-Version: 1.0
References: <20240205171930.968-1-linux.amoon@gmail.com> <20240205171930.968-2-linux.amoon@gmail.com>
In-Reply-To: <20240205171930.968-2-linux.amoon@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 27 Feb 2024 18:33:08 +0530
Message-ID: <CANAwSgSzUW97U8MbWPdb_g4hqEpvLrVDGHG9Gjs2xALbDasqmg@mail.gmail.com>
Subject: Re: [PATCHv1 1/5] arm64: dts: amlogic: Add cache information to the
 Amlogic GXBB and GXL SoC
To: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_050327_344318_5BB7275C 
X-CRM114-Status: UNSURE (   9.75  )
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

Hi Neil,

On Mon, 5 Feb 2024 at 22:50, Anand Moon <linux.amoon@gmail.com> wrote:
>
> As per S905 and S905X datasheet add missing cache information to
> the Amlogic GXBB and GXL SoC.
>
> - Each Cortex-A53 core has 32KB of L1 instruction cache available and
>         32KB of L1 data cache available.
> - Along with 512KB Unified L2 cache.
>
> To improve system performance.
>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> Datasheet
> [0] https://dn.odroid.com/S905/DataSheet/S905_Public_Datasheet_V1.1.4.pdf
> ---

As per the Arm Cortex A53 TRM documentation
[0] https://developer.arm.com/documentation/ddi0500/j/Introduction/Implementation-options?lang=en

Since this SoC supports arm-pmu we could  read cache info using perf
[1] https://www.baeldung.com/linux/analyze-cache-misses

[alarm@archl-librecm ~]$ sudo perf list

List of pre-defined events (to be used in -e or -M):

  branch-instructions OR branches                    [Hardware event]
  branch-misses                                      [Hardware event]
  bus-cycles                                         [Hardware event]
  cache-misses                                       [Hardware event]
  cache-references                                   [Hardware event]
  cpu-cycles OR cycles                               [Hardware event]
  instructions                                       [Hardware event]
  alignment-faults                                   [Software event]
  bpf-output                                         [Software event]
  cgroup-switches                                    [Software event]
  context-switches OR cs                             [Software event]
  cpu-clock                                          [Software event]
  cpu-migrations OR migrations                       [Software event]
  dummy                                              [Software event]
  emulation-faults                                   [Software event]
  major-faults                                       [Software event]
  minor-faults                                       [Software event]
  page-faults OR faults                              [Software event]
  task-clock                                         [Software event]
  duration_time                                      [Tool event]
  user_time                                          [Tool event]
  system_time                                        [Tool event]

armv8_cortex_a53:
  L1-dcache-loads OR armv8_cortex_a53/L1-dcache-loads/
  L1-dcache-load-misses OR armv8_cortex_a53/L1-dcache-load-misses/
  L1-dcache-prefetch-misses OR armv8_cortex_a53/L1-dcache-prefetch-misses/
  L1-icache-loads OR armv8_cortex_a53/L1-icache-loads/
  L1-icache-load-misses OR armv8_cortex_a53/L1-icache-load-misses/
  dTLB-load-misses OR armv8_cortex_a53/dTLB-load-misses/
  iTLB-load-misses OR armv8_cortex_a53/iTLB-load-misses/
  branch-loads OR armv8_cortex_a53/branch-loads/
  branch-load-misses OR armv8_cortex_a53/branch-load-misses/
  node-loads OR armv8_cortex_a53/node-loads/
  node-stores OR armv8_cortex_a53/node-stores/
  br_immed_retired OR armv8_cortex_a53/br_immed_retired/[Kernel PMU event]
  br_mis_pred OR armv8_cortex_a53/br_mis_pred/       [Kernel PMU event]
  br_pred OR armv8_cortex_a53/br_pred/               [Kernel PMU event]
  bus_access OR armv8_cortex_a53/bus_access/         [Kernel PMU event]
  bus_cycles OR armv8_cortex_a53/bus_cycles/         [Kernel PMU event]
  cid_write_retired OR armv8_cortex_a53/cid_write_retired/[Kernel PMU event]
  cpu_cycles OR armv8_cortex_a53/cpu_cycles/         [Kernel PMU event]
  exc_return OR armv8_cortex_a53/exc_return/         [Kernel PMU event]

[alarm@archl-librecm ~]$ perf stat -B -e
cache-references,cache-misses,cycles,instructions,branches,faults,migrations
sleep 5

 Performance counter stats for 'sleep 5':

             52794      cache-references:u
              2311      cache-misses:u                   #    4.38% of
all cache refs
            480343      cycles:u
            140018      instructions:u                   #    0.29
insn per cycle
             15012      branches:u
                46      faults:u
                 0      migrations:u

       5.008073381 seconds time elapsed

       0.000000000 seconds user
       0.006952000 seconds sys

Thanks



-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
